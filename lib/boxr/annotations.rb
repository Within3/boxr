module Boxr
  class Client
    def annotation_from_id(annotation_id)
      annotation_id = ensure_id(annotation_id)
      uri = "#{ANNOTATIONS_URI}/#{annotation_id}"
      annotation, response = get(uri)
      annotation
    end
    alias :annotation :annotation_from_id

    def delete_annotation(annotation_id, if_match: nil)
      annotation_id = ensure_id(annotation_id)
      uri = "#{ANNOTATIONS_URI}/#{annotation_id}"
      result, response = delete(uri, if_match: if_match)
      result
    end

    def create_point_annotation(file_version, message:, x:, y:, page:, thread_id:, page_dimensions:)
      file_version_id = ensure_id(file_version)
      uri = "#{ANNOTATIONS_URI}/"

      attributes = {
        item:{
          type: "file_version",
          id: file_version_id
        },
        details: {
          type: "point",
          location: {
            x: x,
            y: y,
            page: page,
            dimensions: page_dimensions
          },
          threadID: thread_id
        },
        message: message,
        thread: ""
      }

      new_annotation, response = post(uri, attributes)
    end

    def create_highlight_annotation(file_version, message:, quad_points:, page:, thread_id:, page_dimensions:)
      file_version_id = ensure_id(file_version)
      uri = "#{ANNOTATIONS_URI}/"

      attributes = {
        item: {
          type: "file_version",
          id: file_version_id
        },
        details: {
          type: "highlight-comment",
          location: {
            page: page,
            quadPoints: quad_points,
            dimensions: page_dimensions
          },
          threadID: thread_id
        },
        message: message,
        thread: ""
      }

      new_annotation, response = post(uri, attributes)
    end
  end
end
