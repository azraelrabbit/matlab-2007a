function [txu, n_u, n_x, n_o] = ne_dsargs(sys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    mycls = 'NetworkEngine.DynamicSystem';
    if not(isa(sys, mycls))
        error(horzcat('sys argument must be a ', mycls, 'object.'));
    else
        txu{1.0} = 0.0;
        n_x = length(sys.variableData);
        txu{2.0} = zeros(1.0, n_x);
        input_sizes = sys.Input.get('dimension');
        if isa(input_sizes, 'cell')
            input_sizes = cell2mat(input_sizes);
        end % if
        n_u = sum(prod(input_sizes, 2.0));
        txu{3.0} = zeros(1.0, n_u);
        output_sizes = sys.Output.get('dimension');
        if isa(output_sizes, 'cell')
            output_sizes = cell2mat(output_sizes);
        end % if
        n_o = sum(prod(output_sizes, 2.0));
    end % if
end % function
