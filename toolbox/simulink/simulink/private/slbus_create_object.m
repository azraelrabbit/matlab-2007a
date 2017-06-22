function busInfo = slbus_create_object(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    warning('Simulink:slbus_create_object:IsObsolete', 'slbus_create_object is obsolete. Please use Simulink.Bus.createObject');
    % 10 13
    % 11 13
    busInfo = Simulink.Bus.createObject(varargin{:});
