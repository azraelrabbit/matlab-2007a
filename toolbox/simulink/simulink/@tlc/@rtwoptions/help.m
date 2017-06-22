function HelpText = help(This)
    % 1 3
    % 2 3
    HelpText = sprintf('%s', ' The tlc.rtwoptions TargetProperties subclass is designed to provide an ');
    HelpText = sprintf('%s\n%s', HelpText, ' interface only object.');
    % 5 6
    HelpText = sprintf('%s\n%s', HelpText, ' ');
    % 7 8
    HelpText = sprintf('%s\n%s', HelpText, ' It provides an interface to rtwoptions that are defined in TLC files.');
    % 9 10
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 11 12
    HelpText = sprintf('%s\n%s', HelpText, ' The interface provided allows the programatic inclusion of one TLC file''s');
    % 13 14
    HelpText = sprintf('%s\n%s', HelpText, ' rtwoptions and another TLC file.');
    % 15 16
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 17 18
    HelpText = sprintf('%s\n%s', HelpText, ' For TLC options to be properly managed, they must come from the TLC file, ');
    % 19 20
    HelpText = sprintf('%s\n%s', HelpText, ' not from the TargetProperties object stored with the model. For this');
    % 21 22
    HelpText = sprintf('%s\n%s', HelpText, ' reason, this class provides a GetCategories method that returns [];');
    % 23 24
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 25 26
    HelpText = sprintf('%s\n%s', HelpText, ' To use this object to associate options with a target place a sequence of ');
    % 27 28
    HelpText = sprintf('%s\n%s', HelpText, ' lines, like the following, in the master TLC file, rather than the traditional ');
    % 29 30
    HelpText = sprintf('%s\n%s', HelpText, ' individual rtwoptions lines. This example illustrates how to incorporate the');
    % 31 32
    HelpText = sprintf('%s\n%s', HelpText, ' defined rtwoptions of one TLC file with the rtwoptions of a another.');
    % 33 34
    HelpText = sprintf('%s\n%s', HelpText, '  ');
    % 35 36
    HelpText = sprintf('%s\n%s', HelpText, ' What follows is an example that includes the ert target''s rtwoptions with');
    % 37 38
    HelpText = sprintf('%s\n%s', HelpText, ' the PowerPC_DK target''s TLC file.');
    % 39 40
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 41 42
    HelpText = sprintf('%s\n%s', HelpText, '/%');
    % 43 44
    HelpText = sprintf('%s\n%s', HelpText, '  BEGIN_RTW_OPTIONS');
    % 45 46
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 47 48
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).prompt         = ''PowerPC Developers kit options'';');
    % 49 50
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).type           = ''Category'';');
    % 51 52
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).enable         = ''on'';  ');
    % 53 54
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).default        = 1;   % number of items under this category');
    % 55 56
    HelpText = sprintf('%s\n%s', HelpText, '                                      % excluding this one.');
    % 57 58
    HelpText = sprintf('%s\n%s', HelpText, '  % ');
    % 59 60
    HelpText = sprintf('%s\n%s', HelpText, '  % The following are template fields that result in all elements');
    % 61 62
    HelpText = sprintf('%s\n%s', HelpText, '  % of this structured array having all the correct fields.');
    % 63 64
    HelpText = sprintf('%s\n%s', HelpText, '  %');
    % 65 66
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).popupstrings   = '''';');
    % 67 68
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).tlcvariable    = '''';');
    % 69 70
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).tooltip        = '''';');
    % 71 72
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).callback       = '''';');
    % 73 74
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).opencallback   = '''';');
    % 75 76
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).closecallback  = '''';');
    % 77 78
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(1).makevariable   = '''';');
    % 79 80
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 81 82
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 83 84
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).prompt         = ''Start CodeWarrior IDE'';');
    % 85 86
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).type           = ''Checkbox'';');
    % 87 88
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).default        = ''off'';');
    % 89 90
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).tlcvariable    = ''ppcStartCW'';');
    % 91 92
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).tooltip        = [''Start CodeWarrior''];');
    % 93 94
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions(2).makevariable   = ''PPCSTARTCW'';');
    % 95 96
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 97 98
    HelpText = sprintf('%s\n%s', HelpText, '  ertFile     = fullfile(matlabroot, ''rtw'', ''c'', ''ert'', ''ert.tlc'');');
    % 99 100
    HelpText = sprintf('%s\n%s', HelpText, '  ertPropsObj = tlc.rtwoptions(ertFile);');
    % 101 102
    HelpText = sprintf('%s\n%s', HelpText, '  ertProps    = ertPropsObj.getOptions;');
    % 103 104
    HelpText = sprintf('%s\n%s', HelpText, '');
    % 105 106
    HelpText = sprintf('%s\n%s', HelpText, '  rtwoptions = [ertProps rtwoptions];');
    % 107 108
    HelpText = sprintf('%s\n%s', HelpText, '  END_RTW_OPTIONS ');
    % 109 110
    HelpText = sprintf('%s\n%s', HelpText, '%/');
    % 111 112
    HelpText = sprintf('%s\n%s', HelpText, ' ');
    % 113 121
    % 114 121
    % 115 121
    % 116 121
    % 117 121
    % 118 121
    % 119 121
    % 120 121
    return;
end % function
