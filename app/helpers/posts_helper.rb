module PostsHelper
  def status_class(status)
    case status
    when "draft"
      "px-2 py-1 bg-gray-200 text-gray-700 rounded-full"
    when "on_review"
      "px-2 py-1 bg-yellow-200 text-yellow-800 rounded-full"
    when "approved"
      "px-2 py-1 bg-green-200 text-green-800 rounded-full"
    when "rejected"
      "px-2 py-1 bg-red-200 text-red-800 rounded-full"
    else
      "px-2 py-1 bg-gray-200 text-gray-700 rounded-full"
    end
  end
end