function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    narg = size(varargin);
    if eq(narg, 1.0)
        val = getone(A, varargin{1.0});
    else
        subs = varargin{1.0}{1.0};
        for idx=1.0:length(subs)
            val{idx} = getone(A(subs(idx)), varargin{2.0:end});
        end % for
    end % if
function val = getone(A, property)
    % 17 21
    % 18 21
    % 19 21
    switch property
    case 'UIContextMenu'
        val = getscribecontextmenu(A.HGHandle);
        return;
    case 'IsSelected'
        val = A.ObjSelected;
        return;
    case 'Draggable'
        val = A.Draggable;
    case 'DragConstraint'
        val = A.DragConstraint;
    case 'SavedState'
        val = A.SavedState;
    case 'MyHandle'
        try
            ud = getscribeobjectdata(A.HGHandle);
            val = ud.HandleStore;
        catch
            val = [];
            warning('MATLAB:get:ObjectNotFound', 'Object is nonexistent or corrupted...');
        end % try
        return;
    case 'MyHGHandle'
        val = A.HGHandle;
    case 'MyBin'
        val = A.ObjBin;
        if not(isempty(val)) && iscell(val)
            val = val{:};
        end % if
        return;
    case 'NextItem'
        val = LGetItemI(A, 1.0);
    case 'PrevItem'
        val = LGetItemI(A, -1.0);
    case 'AllItems'
        myhandle = get(A, 'myhandle');
        val = A.ObjBin;
        if not(isempty(val)) && iscell(val)
            val = val{:};
            if isa(val, 'hgbin')
                val = get(val, 'items');
            else
                val = myhandle;
            end % if
        end % if
    case 'OtherItems'
        val = A.ObjBin;
        if not(isempty(val)) && iscell(val)
            val = val{:};
            if isa(val, 'hgbin')
                siblings = get(val, 'items');
                myhandle = get(A, 'myhandle');
                val = siblings(find(ne(siblings, myhandle)));
            else
                val = {};
            end % if
        end % if
    otherwise
        val = get(A.HGHandle, property);
    end % switch
function val = LGetItemI(A, offset)
    % 81 85
    % 82 85
    % 83 85
    val = A.ObjBin;
    if not(isempty(val)) && iscell(val)
        val = val{:};
        if isa(val, 'hgbin')
            siblings = get(val, 'Items');
            myhandle = get(A, 'MyHandle');
            iNextItem = plus(find(eq(siblings, myhandle)), offset);
            iNextItem = iNextItem(1.0);
            if ge(iNextItem, 1.0) && le(iNextItem, length(siblings))
                val = siblings(iNextItem);
            else
                val = {};
            end % if
        else
            val = {};
        end % if
    end % if
