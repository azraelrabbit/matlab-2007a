%  function out = sbioconsmoietyhandler(action, varargin)
%      % 1 14
%      % 2 14
%      % 3 14
%      % 4 14
%      % 5 14
%      % 6 14
%      % 7 14
%      % 8 14
%      % 9 14
%      % 10 14
%      % 11 14
%      % 12 14
%      % 13 14
% MATASS1 59 out 0 [] ['[]']
%      out = [];
%      % 15 16
%      switch action
%      otherwise
% MATASS1 71 v% 0 [] []
% SWITCHCMP  78 SWITCHCMP ('matnum=19', '("v%")') {'matnum': '19'}
%      case 'getmoiety'
% IF0 SWITCH 80 ('skip=466', '(to', '548)') {'skip': '466'}
%          % 18 19
% stack: ['1.0'] 1
% MATASS1 97 obj 0 [] ['varargin{1.0}']
%          obj = varargin{1.0};
% stack: ['2.0'] 1
% MATASS1 119 alg 1 [] ['char(varargin{2.0})']
%          alg = char(varargin{2.0});
%          % 21 23
%          % 22 23
% MXMARSHALCONST skip ('index=', '8', 'size(ints)', '=')
% MXMARSHALCONST data ('14', '1296630016,', '0,', '14,', '40,', '6,', '8,', '1,', '0,', '5,', '8,', '0,', '0,', '1,', '0')
% MXMARSHALCONST parsed {}
% MATASS1 128 out 0 [] ['{}']
%          out = {};
%          % 24 26
%          % 25 26
% MATASS1 146 g 2 [] ['sbioconsmoiety(obj, alg)']
% MATASS1 149 allSpecies 1 ['g'] ['sbioconsmoiety(obj, alg)']
%          [g, allSpecies] = sbioconsmoiety(obj, alg);
%          % 27 28
%          for i=1.0:size(g, 1.0)
% for 546
%              % 29 30
% MATASS1 200 next 1 [] ['g(i, :)']
%              next = g(i, :);
% MATASS1 222 indices 1 [] ['find(ge(next, 1.0))']
%              indices = find(ge(next, 1.0));
% MATASS1 235 nextsp 0 [] ['allSpecies(indices)']
%              nextsp = allSpecies(indices);
%              % 33 36
%              % 34 36
%              % 35 36
% MATASS1 244 expression 0 [] ["''"]
%              expression = '';
% MXMARSHALCONST skip ('index=', '8', 'size(ints)', '=')
% MXMARSHALCONST data ('14', '1296630016,', '0,', '14,', '40,', '6,', '8,', '1,', '0,', '5,', '8,', '0,', '0,', '1,', '0')
% MXMARSHALCONST parsed {}
% MATASS1 253 spObj 0 [] ['{}']
%              spObj = {};
%              for j=1.0:length(indices)
% for 428
% MATASS1 290 index 1 [] ['next(indices(j))']
%                  index = next(indices(j));
% IF0 306 ('skip=29', '(to', '337)') {'skip': '29'} ne(index, 1.0)
%                  if ne(index, 1.0)
% MATASS1 333 expression 1 [] ["horzcat(expression, num2str(index), ' ')"]
%                      expression = horzcat(expression, num2str(index), ' ');
%                  end % if
% stack: ['expression', 'j'] 1
% MATASS1 365 expression 1 [] ["horzcat(expression, nextsp{j}, ' + ')"]
%                  expression = horzcat(expression, nextsp{j}, ' + ');
% stack: ['obj', "'Type'", "'species'", "'Name'", 'j'] 1
%                  spObj{plus(end, 1.0)} = sbioselect(obj, 'Type', 'species', 'Name', nextsp{j});
% end 427 () {}
%              end % for 
%              % 46 49
%              % 47 49
%              % 48 49
%              out{plus(end, 1.0)} = expression(1.0:minus(end, 3.0));
% stack: [':'] 1
%              out{plus(end, 1.0)} = java(horzcat(spObj{:}));
% end 545 () {}
%          end % for 
%  end
function out = sbioconsmoietyhandler(action, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    out = [];
    % 15 16
    switch action
    case 'getmoiety'
        % 18 19
        obj = varargin{1.0};
        alg = char(varargin{2.0});
        % 21 23
        % 22 23
        out = {};
        % 24 26
        % 25 26
        [g, allSpecies] = sbioconsmoiety(obj, alg);
        % 27 28
        for i=1.0:size(g, 1.0)
            % 29 30
            next = g(i, :);
            indices = find(ge(next, 1.0));
            nextsp = allSpecies(indices);
            % 33 36
            % 34 36
            % 35 36
            expression = '';
            spObj = {};
            for j=1.0:length(indices)
                index = next(indices(j));
                if ne(index, 1.0)
                    expression = horzcat(expression, num2str(index), ' ');
                end % if
                expression = horzcat(expression, nextsp{j}, ' + ');
                spObj{plus(end, 1.0)} = sbioselect(obj, 'Type', 'species', 'Name', nextsp{j});
            end % for 
            % 46 49
            % 47 49
            % 48 49
            out{plus(end, 1.0)} = expression(1.0:minus(end, 3.0));
            out{plus(end, 1.0)} = java(horzcat(spObj{:}));
        end % for 
end
