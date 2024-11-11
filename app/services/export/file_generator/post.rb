module Export
  module FileGenerator
    class Post
      attr_reader :posts

      def initialize(posts)
        @posts = posts
      end

      def call
        generated_file
      end

      def generated_file
        package = Axlsx::Package.new
        workbook = package.workbook

        workbook.add_worksheet(name: "Posts Report") do |sheet|
          sheet.add_row headers

          posts.each do |post|
            sheet.add_row post_row(post)
          end
        end

        package
      end

      private

      def headers
        [ "Author", "Region", "Title", "Body", "Images", "Files", "Published At" ]
      end

      def post_row(post)
        [
          post.user.full_name,
          post.region.name,
          post.title,
          post.body,
          post.image_urls.join("\n"),
          post.files_urls.join("\n"),
          post.published_at.strftime("%d %B %Y at %H:%M")
        ]
      end
    end
  end
end
