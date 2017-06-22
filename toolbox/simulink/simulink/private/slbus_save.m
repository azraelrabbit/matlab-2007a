function slbus_save(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    warning('Simulink:slbus_save:IsObsolete', 'slbus_save is obsolete. Please use Simulink.Bus.save');
    % 10 12
    Simulink.Bus.save(varargin{:});
