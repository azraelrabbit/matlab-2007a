function hdlHelp(hDlg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    topicID = 'slhdlcoder_gui_HDL_Opts';
    % 11 12
    hSrc = getDialogSource(hDlg);
    index = get(hSrc, 'HDLCActiveTab');
    % 14 15
    switch index
    case 0.0
        topicID = 'slhdlcoder_gui_HDL_Opts';
    case 1.0
        topicID = 'slhdlcoder_gui_Global_Set';
    case 2.0
        topicID = 'slhdlcoder_gui_Test_Bench';
    case 3.0
        topicID = 'slhdlcoder_gui_EDA_Scripts';
    end % switch
    helpview(fullfile(docroot, 'toolbox', 'slhdlcoder', 'slhdlcoder_ug.map'), topicID)
end % function
