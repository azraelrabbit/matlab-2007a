function [vars, refs, isfunction] = pGetVarsAndRefs(obj, tree)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    function_nodes = tree.find('Kind', 'FUNCTION');
    if isempty(function_nodes)
        % 22 23
        [vars, refs] = i_getvarsandrefs(tree);
        isfunction = false;
    else
        % 26 27
        funcnodes = tree.find('Kind', 'FUNCTION');
        funcind = indices(funcnodes);
        funcnames = funcnodes.path('Fname').strings();
        refs = cell(size(funcnames));
        for i=funcind
            thisnode = funcnodes.select(i);
            % 33 35
            % 34 35
            [ignore_fvars, frefs] = i_getvarsandrefs(subtree(thisnode));
            % 36 37
            frefs = setdiff(frefs, funcnames);
            refs{i} = frefs;
        end % for
        refs = dependencies.cellcat(refs{:});
        vars = {};
        isfunction = true;
    end % if
end % function
function [vars, refs] = i_getvarsandrefs(tree)
    % 46 49
    % 47 49
    % 48 49
    assignment_node = tree.find('Kind', 'EQUALS');
    assigned_node = assignment_node.path('L');
    % 51 53
    % 52 53
    next_node = assigned_node.path('Next');
        while next_node.count()
        assigned_node = or(assigned_node, next_node);
        next_node = next_node.path('Next');
    end % while
    % 58 60
    % 59 60
    all_assignments = assigned_node.find('Kind', 'ID');
    % 61 62
    not_assignment = minus(assigned_node, all_assignments);
        while not_assignment.count()
        % 64 67
        % 65 67
        % 66 67
        assigned_node = not_assignment.path('L');
        is_assignment = assigned_node.find('Kind', 'ID');
        % 69 70
        not_assignment = minus(assigned_node, is_assignment);
        % 71 72
        all_assignments = or(all_assignments, is_assignment);
    end % while
    vars = all_assignments.strings();
    % 75 77
    % 76 77
    for_nodes = tree.find('Kind', 'FOR');
    var_nodes = for_nodes.path('L.L');
    c = var_nodes.count();
    var_nodes = var_nodes.find('Kind', 'ID');
    if lt(var_nodes.count(), c)
        warning('Failed to find loop variable name for one or more FOR nodes ');
    end % if
    loop_var_names = var_nodes.strings();
    % 85 87
    % 86 87
    global_nodes = tree.find('Kind', 'GLOBAL');
    var_nodes = global_nodes.path('L');
    % 89 91
    % 90 91
    global_var_names = var_nodes.strings();
    % 92 94
    % 93 94
    persistent_nodes = tree.find('Kind', 'PERSISTENT');
    var_nodes = persistent_nodes.path('L');
    % 96 98
    % 97 98
    persistent_var_names = var_nodes.strings();
    % 99 101
    % 100 101
    function_nodes = tree.find('Kind', 'FUNCTION');
    args = i_argument_names(function_nodes);
    % 103 104
    vars = dependencies.cellcat(vars, global_var_names, persistent_var_names, loop_var_names, args);
    % 105 106
    vars = unique(vars);
    % 107 110
    % 108 110
    % 109 110
    ref_nodes = tree.find('Kind', 'ID');
    % 111 112
    parents = ref_nodes.path('Parent');
    dot_nodes = parents.find('Kind', 'DOT');
    right_args = dot_nodes.path('R');
    ref_nodes = minus(ref_nodes, right_args);
    % 116 117
    ref_strings = ref_nodes.strings();
    % 118 124
    % 119 124
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    correct_arg_type = dot_nodes.find('L.Kind', 'ID', 'R.Kind', 'FIELD');
    left_args = correct_arg_type.path('L');
    right_args = correct_arg_type.path('R');
    dependencies.assert(eq(left_args.count(), right_args.count()), 'Arguments should be paired');
    % 128 129
    left_strings = left_args.strings();
    if numel(left_strings)
        % 131 135
        % 132 135
        % 133 135
        % 134 135
        ispackage = false(size(left_strings));
        for i=1.0:numel(left_strings)
            ispackage(i) = not(isempty(findpackage(left_strings{i})));
        end % for
        % 139 140
        not_refs = left_strings(ispackage);
        ref_strings = setdiff(ref_strings, not_refs);
        % 142 145
        % 143 145
        % 144 145
        package_names = left_strings(ispackage);
        if numel(package_names)
            package_names = strcat(package_names, '.schema');
            ref_strings = dependencies.cellcat(ref_strings, package_names);
        end % if
        ref_strings = dependencies.cellcat(ref_strings, package_names);
        % 151 153
        % 152 153
    end % if
    % 154 156
    % 155 156
    refs = setdiff(ref_strings, vars);
end % function
function argnames = i_argument_names(function_nodes)
    % 159 165
    % 160 165
    % 161 165
    % 162 165
    % 163 165
    % 164 165
    arg_nodes = function_nodes.path('Ins');
    argnames = {};
        while arg_nodes.count()
        moreargs = arg_nodes.strings();
        argnames = dependencies.cellcat(argnames, moreargs);
        % 170 171
        arg_nodes = arg_nodes.path('Next');
    end % while
end % function
