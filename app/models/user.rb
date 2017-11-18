class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :information
  has_many :activity
  accepts_nested_attributes_for :information

  def name
    self.information.name
  end

  def info
    self.information
  end

  def summarize_activities_each_year
    activity = self.activity
    return {} if activity.empty?

    summary = activity.group("date_part('year', timezone('Asia/Tokyo', achieved_at))").group(:title).count
    # このような結果が得られる {[2017.0, "aaa"]=>1, [2017.0, "bbb"]=>2, [2016.0, "ccc"]=>2, [2015.0, "ddd"]=>3}

    summary_each_year = {}
    max_year          = activity.maximum(:achieved_at).year
    min_year          = activity.minimum(:achieved_at).year

    (min_year..max_year).reverse_each do |year|

      summary_each_year[year] = []

      years = summary.each do |key, value|
        if year == key[0].to_i
          summary_each_year[year] << [key[1], value]
        end
      end
    end
    summary_each_year
    # このような結果が得られる {2017 => [["aaa", 1], ["bbb", 2]], 2016 => [["ccc", 2]], 2015 => [["ddd",3]]}
  end
end
