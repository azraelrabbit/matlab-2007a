function entry = pm_libdef
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    root = NetworkEngine.RootLibrary;
    entry = nesl_makepmlibdef(root.fl);
    % 9 10
    entry.Annotation = sprintf('Foundation Library\n%s', pmsl_copyright(2005.0));
    % 11 14
    % 12 14
    % 13 14
    entry.ForwardingTable = cellhorzcat(cellhorzcat('fl_lib/Hydraulic/Hydraulic Elements/Pressure Compensator', sprintf('sh_lib/Valves/Pressure Control\nValves/Pressure Compensator')), {'fl_lib/Hydraulic/Hydraulic Elements/Annular Orifice','sh_lib/Orifices/Annular Orifice'}, {'fl_lib/Hydraulic/Hydraulic Elements/Fixed Orifice','sh_lib/Orifices/Fixed Orifice'}, {'fl_lib/Hydraulic/Hydraulic Elements/Variable Orifice','sh_lib/Orifices/Variable Orifice'}, cellhorzcat(sprintf('fl_lib/Hydraulic/Hydraulic Elements/Orifice with\nVariable Area Round\nHoles'), sprintf('sh_lib/Orifices/Orifice with\nVariable Area Round\nHoles')), cellhorzcat(sprintf('fl_lib/Hydraulic/Hydraulic Elements/Orifice with\nVariable Area Slot'), sprintf('sh_lib/Orifices/Orifice with\nVariable Area Slot')));
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
end % function
