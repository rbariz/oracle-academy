
  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ACADEMY_UI" as

    function status_badge_class (
        p_domain in varchar2,
        p_value  in varchar2
    ) return varchar2
    is
    begin
        return
            case upper(p_domain)

                when 'CERTIFIED' then
                    case upper(p_value)
                        when 'YES' then 't-Badge--success'
                        when 'NO'  then 't-Badge--danger'
                        else null
                    end

                when 'ENROLLMENT' then
                case upper(p_value)
                    when 'COMPLETED' then 't-Badge--success'
                    when 'CONFIRMED' then 't-Badge--warning'
                    when 'FAILED'    then 't-Badge--danger'
                    else null
                end


               when 'ATTENDANCE' then
                case upper(p_value)
                    when 'PRESENT' then 't-Badge--success'
                    when 'ABSENT'  then 't-Badge--danger'
                    else null
                end

                when 'CERTIFICATION' then
                    case upper(p_value)
                        when 'ISSUED'  then 't-Badge--success'
                        when 'REVOKED' then 't-Badge--danger'
                        else null
                end

                when 'COURSE' then
                    case upper(p_value)
                        when 'ACTIVE'   then 't-Badge--success'
                        when 'INACTIVE' then 't-Badge--danger'
                        else null
                end

                else
                    null
            end;
    end status_badge_class;

    function status_badge (
    p_domain in varchar2,
    p_value  in varchar2
) return varchar2
is
    l_class varchar2(100);
begin
    l_class := status_badge_class(
        p_domain => p_domain,
        p_value  => p_value
    );

    return
        '<span class="t-Badge'
        || case
               when l_class is not null
               then ' ' || l_class
           end
        || '">'
        || apex_escape.html(p_value)
        || '</span>';
end status_badge;

end academy_ui;
/

