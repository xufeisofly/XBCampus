json.extract! post, :id, :topic, :content, :category
json.tag I18n.t("post.categories.#{post.category}")