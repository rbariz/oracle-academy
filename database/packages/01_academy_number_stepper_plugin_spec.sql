
  CREATE OR REPLACE EDITIONABLE PACKAGE "ACADEMY_NUMBER_STEPPER_PLUGIN" as

    procedure render (
        p_item   in            apex_plugin.t_item,
        p_plugin in            apex_plugin.t_plugin,
        p_param  in            apex_plugin.t_item_render_param,
        p_result in out nocopy apex_plugin.t_item_render_result
    );

    procedure validate (
    p_item   in            apex_plugin.t_item,
    p_plugin in            apex_plugin.t_plugin,
    p_param  in            apex_plugin.t_item_validation_param,
    p_result in out nocopy apex_plugin.t_item_validation_result
);

end academy_number_stepper_plugin;
/

