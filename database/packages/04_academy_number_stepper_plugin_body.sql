
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACADEMY_NUMBER_STEPPER_PLUGIN" as

/*
    procedure render (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
)
is
    l_min_value varchar2(32767);
    l_max_value varchar2(32767);
    l_step      varchar2(32767);
begin

    l_min_value :=
        p_item.attributes.get_varchar2(
            p_static_id => 'minimum_value'
        );

    l_max_value :=
        p_item.attributes.get_varchar2(
            p_static_id => 'maximum_value'
        );

    l_step :=
        p_item.attributes.get_varchar2(
            p_static_id => 'step'
        );

    sys.htp.prn(
        '<input type="number"' ||

        ' id="' ||
            apex_escape.html_attribute(p_item.name) ||
        '"' ||

        ' name="' ||
            apex_escape.html_attribute(p_item.name) ||
        '"' ||

        ' value="' ||
            apex_escape.html_attribute(p_param.value) ||
        '"' ||

        case
            when l_min_value is not null then
                ' data-min="' ||
                apex_escape.html_attribute(l_min_value) ||
                '"'
        end ||

        case
            when l_max_value is not null then
                ' data-max="' ||
                apex_escape.html_attribute(l_max_value) ||
                '"'
        end ||

        case
            when l_step is not null then
                ' data-step="' ||
                apex_escape.html_attribute(l_step) ||
                '"'
        end ||

        '>'
    );

end render;
*/

procedure render (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_render_param,
    p_result in out nocopy apex_plugin.t_item_render_result
)
is
    l_min_value varchar2(32767);
    l_max_value varchar2(32767);
    l_step      varchar2(32767);
begin

    l_min_value :=
        p_item.attributes.get_varchar2(
            p_static_id => 'minimum_value'
        );

    l_max_value :=
        p_item.attributes.get_varchar2(
            p_static_id => 'maximum_value'
        );

    l_step :=
        p_item.attributes.get_varchar2(
            p_static_id => 'step'
        );

    if p_param.is_readonly then

        sys.htp.prn(
            '<span class="academy-number-stepper-readonly">' ||
                apex_escape.html(p_param.value) ||
            '</span>'
        );
        /*
        sys.htp.prn(
        '<span class="academy-number-stepper-readonly">' ||
        case
            when p_param.value is null then
                '[NULL]'
            else
                apex_escape.html(p_param.value)
        end ||
        '</span>'
    );*/

        return;

    end if;

    sys.htp.prn(
        '<div class="academy-number-stepper" ' ||
             'id="' || apex_escape.html_attribute(p_item.name || '_STEPPER') || '">' ||

            '<button type="button" ' ||
                    'class="t-Button academy-number-stepper-minus" ' ||
                    'aria-label="Decrease">âˆ’</button>' ||

            '<input type="text"' ||
    ' id="' ||
        apex_escape.html_attribute(p_item.name) ||
    '"' ||

    ' name="' ||
        apex_escape.html_attribute(p_item.name) ||
    '"' ||

    ' class="number_field apex-item-text apex-item-number u-textCenter"' ||

    ' value="' ||
        apex_escape.html_attribute(p_param.value) ||
    '"' ||

    ' inputmode="decimal"' ||

    case
        when l_min_value is not null then
            ' data-min="' ||
            apex_escape.html_attribute(l_min_value) ||
            '"'
    end ||

    case
        when l_max_value is not null then
            ' data-max="' ||
            apex_escape.html_attribute(l_max_value) ||
            '"'
    end ||

    case
        when l_step is not null then
            ' data-step="' ||
            apex_escape.html_attribute(l_step) ||
            '"'
    end ||

'>' ||

            '<button type="button" ' ||
                    'class="t-Button academy-number-stepper-plus" ' ||
                    'aria-label="Increase">+</button>' ||

        '</div>'
    );
     /* js Ã  refactorer voir .js file du plugin
    apex_javascript.add_inline_code(
        p_code =>
            '(function () {' ||

            'const input = document.getElementById(' ||
                apex_javascript.add_value(p_item.name, false) ||
            ');' ||

            'if (!input) { return; }' ||

            'const wrapper = document.getElementById(' ||
                apex_javascript.add_value(p_item.name || '_STEPPER', false) ||
            ');' ||

            'if (!wrapper) { return; }' ||

            'const minus = wrapper.querySelector(".academy-number-stepper-minus");' ||
            'const plus  = wrapper.querySelector(".academy-number-stepper-plus");' ||

            'const min  = input.dataset.min  !== undefined ? Number(input.dataset.min)  : null;' ||
            'const max  = input.dataset.max  !== undefined ? Number(input.dataset.max)  : null;' ||
            'const step = input.dataset.step !== undefined ? Number(input.dataset.step) : 1;' ||

            'function changeValue(direction) {' ||
                'let current;' ||

                'if (input.value === "") {' ||
                    'if (direction > 0) {' ||
                        'current = min !== null ? min - step : 0;' ||
                    '} else {' ||
                        'current = min !== null ? min + step : 0;' ||
                    '}' ||
                '} else {' ||
                    'current = Number(input.value);' ||
                '}' ||

                'let next = current + (direction * step);' ||

                'if (min !== null) {' ||
                    'next = Math.max(min, next);' ||
                '}' ||

                'if (max !== null) {' ||
                    'next = Math.min(max, next);' ||
                '}' ||

                'input.value = String(next);' ||
                'input.dispatchEvent(new Event("change", { bubbles: true }));' ||
            '}' ||

            'minus.addEventListener("click", function () {' ||
                'changeValue(-1);' ||
            '});' ||

            'plus.addEventListener("click", function () {' ||
                'changeValue(1);' ||
            '});' ||

            '})();'
    );*/

end render;

    procedure validate (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result
)
is
    l_min_value number;
    l_max_value number;
    l_value     number;
begin

    -- Valeur vide : ce n'est pas Ã  Min/Max de gÃ©rer "Required"
    if p_param.value is null then
        return;
    end if;

    -- Valeur saisie
    begin
        l_value := to_number(p_param.value);
    exception
        when value_error then
            p_result.message :=
                '#LABEL# must be a valid number.';
            return;
    end;

    -- Minimum configurÃ©
    if p_item.attributes.get_varchar2(
           p_static_id => 'minimum_value'
       ) is not null
    then
        l_min_value :=
            to_number(
                p_item.attributes.get_varchar2(
                    p_static_id => 'minimum_value'
                )
            );

        if l_value < l_min_value then
            p_result.message :=
                '#LABEL# must be greater than or equal to ' ||
                l_min_value || '.';
            return;
        end if;
    end if;

    -- Maximum configurÃ©
    if p_item.attributes.get_varchar2(
           p_static_id => 'maximum_value'
       ) is not null
    then
        l_max_value :=
            to_number(
                p_item.attributes.get_varchar2(
                    p_static_id => 'maximum_value'
                )
            );

        if l_value > l_max_value then
            p_result.message :=
                '#LABEL# must be less than or equal to ' ||
                l_max_value || '.';
            return;
        end if;
    end if;

end validate;

/*
procedure validate (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result
)
is
begin

    p_result.message :=
        'TEST NUMBER STEPPER VALIDATION - value=[' ||
        nvl(p_param.value, 'NULL') ||
        ']';

    p_result.display_location :=
        apex_plugin.c_inline_with_field_and_notif;

    p_result.page_item_name :=
        p_item.name;

end validate;*/

end academy_number_stepper_plugin;
/

