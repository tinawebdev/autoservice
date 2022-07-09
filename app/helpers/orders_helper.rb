module OrdersHelper
  def visibility(order)
    if order.status
      content_tag(:span, "В работе", class: "tag is-medium")
    else
      content_tag(:span, "Завершен", class: "tag is-warning is-medium")
    end
  end
end
