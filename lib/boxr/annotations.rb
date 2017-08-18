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
  end
end
