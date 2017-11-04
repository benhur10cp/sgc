module ApplicationHelper
  def date_picker(form, field, label=nil, place_holder=nil, required=false, style=nil, disabled_plugin=false, valor_conteudo=nil, onchange=nil)
    style ||= "width: 120px;"
    valor = valor_conteudo if valor_conteudo
    valor = form.object.attributes[field.to_s].to_date.to_s_br if form.object.attributes[field.to_s] and valor_conteudo == nil
    form.text_field field, label: label, value: valor, placeholder: place_holder, data_required: required, class: "form-control input-lg data", "data-provide" => 'datepicker', "data-mask" => '99/99/9999', date_picker: "input-small date date-picker", html_icon: "<span class=\"input-group-btn\" style=\"vertical-align: top;\"><button class=\"btn btn-info\" type=\"button\"><i class=\"fa fa-calendar\"></i></button></span>", style: style, disable_plugin: disabled_plugin, onchange: onchange
  end

  def date_range_picker_tag(campo_inicio, campo_final, label, valor_inicio = nil, valor_final = nil, required = false, bootstrapform = true, customize = nil)
    conteudo = "<div class='form-group' data_required='#{required}'>"
    conteudo += "<label class='control-label'>#{label}</label>" if label
    conteudo += "<div class='input-group input-small'>
       #{text_field_tag campo_inicio, valor_inicio, :class => 'form-control input-small datepicker date-picker', :style => 'border-top-left-radius: 4px; border-bottom-left-radius: 4px;', :disable_plugin => true}
          <span class='input-group-addon date-range-picker'>até</span>
      #{text_field_tag campo_final, valor_final, :class => 'form-control input-small datepicker date-picker', :style => 'border-top-right-radius: 4px; border-bottom-right-radius: 4px;', :disable_plugin => true}
      </div>
  </div>"
    conteudo.html_safe
  end
end
