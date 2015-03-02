module BlogsHelper
  def blog_permalink(id)
    Blog.find_by(id: id).permalink
  end
  
  def blog_entity(id)
    Blog.find_by(id: id)
  end
  
  def year_month_blogs(year_month)
    if year_month == 'all'
      Blog.all
    else
      case ActiveRecord::Base.connection.adapter_name
      when 'SQLite'
        Blog.where("created_at like ?", year_month + "%")
      when 'MySQL'
        Blog.where("created_at like ?", year_month + "%")
      when 'PostgreSQL'
        year_month_arr = year_month.split('-')
        Blog.where("date_part('year', created_at) = ? and date_part('month', created_at) = ?", year_month_arr[0], year_month_arr[1])
      else
        Blog.all
      end
    end
  end
  
  def year_month_blog_count(year_month)
    created_at = year_month_blogs(year_month).order("created_at DESC").pluck(:created_at)
    year_month_blog_count = Hash.new{ |h, key| h[key] = [] }
    created_at.each do |c|
      year_month_blog_count[c.strftime('%Y-%m')] << 1
    end
    year_month_blog_count = Hash[year_month_blog_count.map{ |k, v| [k, v.reduce(:+)] }]
  end
end
