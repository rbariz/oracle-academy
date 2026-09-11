
  CREATE OR REPLACE EDITIONABLE PACKAGE "ACADEMY_UI" as

    function status_badge_class (
        p_domain in varchar2,
        p_value  in varchar2
    ) return varchar2;

    function status_badge (
    p_domain in varchar2,
    p_value  in varchar2
) return varchar2;

end academy_ui;
/

