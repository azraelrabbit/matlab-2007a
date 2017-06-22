function slbus_cell_to_object(busCell)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    warning('Simulink:slbus_cell_to_object:IsObsolete', 'slbus_cell_to_object is obsolete. Please use Simulink.Bus.cellToObject');
    % 11 14
    % 12 14
    Simulink.Bus.cellToObject(busCell);
