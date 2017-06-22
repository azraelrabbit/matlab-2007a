function hObj = LibraryEntry(lib, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    name = horzcat(lib.name, '_lib');
    getIcon = nesl_private('nesl_getitemicon');
    % 15 16
    hObj = NetworkEngine.LibraryEntry;
    % 17 18
    hObj.initialize(name, lib.info.Product, varargin{:});
    % 19 20
    hObj.Object = lib;
    hObj.Descriptor = lib.Descriptor;
    hObj.Icon = getIcon(lib);
    hObj.Annotation = hObj.Descriptor;
    hObj.ForwardingTable = {};
    hObj.BaseBlockSize = 40.0;
    % 26 27
end % function
