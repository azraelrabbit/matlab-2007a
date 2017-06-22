function varargout = mech_animateTab(varargin)
    % 1 36
    % 2 36
    % 3 36
    % 4 36
    % 5 36
    % 6 36
    % 7 36
    % 8 36
    % 9 36
    % 10 36
    % 11 36
    % 12 36
    % 13 36
    % 14 36
    % 15 36
    % 16 36
    % 17 36
    % 18 36
    % 19 36
    % 20 36
    % 21 36
    % 22 36
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    ni = nargin;
    no = nargout;
    error(nargchk(2.0, 4.0, ni, 'struct'));
    % 38 40
    H = varargin{1.0};
    action = varargin{2.0};
    % 41 43
    switch action
    case 'create'
        error(nargchk(3.0, 3.0, ni, 'struct'));
        [Main, s] = localCreateTab(H, varargin{3.0});
        varargout{1.0} = Main;
        if gt(no, 1.0)
            varargout{2.0} = s;
        end % if
    case 'getenv'
        % 51 53
        MechEnv = localGetEnvironment(H);
        if nargout
            varargout{1.0} = MechEnv;
        end % if
    case 'toString'
        % 57 59
        error(nargchk(3.0, 3.0, ni, 'struct'));
        valStr = localToString(varargin{3.0});
        if nargout
            varargout{1.0} = valStr;
        end % if
    case 'fromString'
        error(nargchk(3.0, 3.0, ni, 'struct'));
        env = localFromString(H, varargin{3.0});
        if nargout
            varargout{1.0} = env;
        end % if
    end % switch
function [Main, s] = localCreateTab(Frame, env)
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    ControlLabels = getControlLabels;
    % 78 81
    % 79 81
    GL_51 = java.awt.GridLayout(5.0, 1.0, 0.0, 3.0);
    GL_12 = java.awt.GridLayout(1.0, 2.0, 0.0, 3.0);
    FL_L = java.awt.FlowLayout(java.awt.FlowLayout.LEFT, 0.0, 0.0);
    % 83 85
    if isunix
        JavaFontSize = 12.0;
    else
        JavaFontSize = 11.0;
    end % if
    % 89 92
    % 90 92
    Main = com.mathworks.mwt.MWPanel(com.mathworks.mwt.MWBorderLayout(5.0, 3.0));
    % 92 95
    % 93 95
    s.DescriptionPanel = com.mathworks.mwt.MWPanel(FL_L);
    Main.add(s.DescriptionPanel, com.mathworks.mwt.MWBorderLayout.NORTH);
    % 96 98
    DescriptionStr = sprintf('%s\n%s\n%s', 'To draw a geometrical representation of the machine, select "Draw', 'machine in initial state." To animate the machine while running the', 'model, select "Animate machine during simulation."');
    % 98 102
    % 99 102
    % 100 102
    s.DescriptionText = com.mathworks.mwt.MWLabel(DescriptionStr);
    s.DescriptionPanel.add(s.DescriptionText);
    s.DescriptionText.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    % 104 107
    % 105 107
    s.PromptLabelPanel = com.mathworks.mwt.MWPanel(GL_51);
    Main.add(s.PromptLabelPanel, com.mathworks.mwt.MWBorderLayout.CENTER);
    % 108 112
    % 109 112
    % 110 112
    s.BodyShapePanel = com.mathworks.mwt.MWPanel(GL_12);
    s.PromptLabelPanel.add(s.BodyShapePanel);
    % 113 116
    % 114 116
    s.BodyShapeLabel = com.mathworks.mwt.MWLabel(sprintf(ControlLabels.PromptLabels{3.0}));
    s.BodyShapePanel.add(s.BodyShapeLabel);
    s.BodyShapeLabel.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    % 118 121
    % 119 121
    s.BodyShape = com.mathworks.mwt.MWChoice;
    s.BodyShapePanel.add(s.BodyShape);
    s.BodyShape.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    s.BodyShape.add(sprintf(ControlLabels.shapeOPTS{1.0}));
    s.BodyShape.add(sprintf(ControlLabels.shapeOPTS{2.0}));
    % 125 128
    % 126 128
    s.BodyShape.select(env.Visualization.BodyShape);
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    s.ConstructInit = com.mathworks.mwt.MWCheckbox(sprintf(ControlLabels.PromptLabels{2.0}), env.Visualization.ConstructInit);
    % 134 136
    s.PromptLabelPanel.add(s.ConstructInit);
    s.ConstructInit.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    % 137 139
    FL_L2 = java.awt.FlowLayout(java.awt.FlowLayout.LEFT, 18.0, 0.0);
    % 139 141
    s.UpdateImmediatelyPanel = com.mathworks.mwt.MWPanel(FL_L2);
    s.PromptLabelPanel.add(s.UpdateImmediatelyPanel);
    s.UpdateImmediateLabel = com.mathworks.mwt.MWLabel(sprintf(ControlLabels.PromptLabels{4.0}));
    s.UpdateImmediatelyPanel.add(s.UpdateImmediateLabel);
    s.UpdateImmediateLabel.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    % 145 148
    % 146 148
    s.UpdateImmediate = com.mathworks.mwt.MWChoice;
    s.UpdateImmediatelyPanel.add(s.UpdateImmediate);
    s.UpdateImmediate.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
    s.UpdateImmediate.add(sprintf(ControlLabels.updateOPTS{1.0}));
    s.UpdateImmediate.add(sprintf(ControlLabels.updateOPTS{2.0}));
    s.UpdateImmediate.select(env.Visualization.UpdateImmediate);
    % 153 156
    % 154 156
    s.AnimateSim = com.mathworks.mwt.MWCheckbox(sprintf(ControlLabels.PromptLabels{5.0}), env.Visualization.AnimateSim);
    % 156 158
    s.PromptLabelPanel.add(s.AnimateSim);
    s.AnimateSim.setFont(java.awt.Font('Dialog', java.awt.Font.PLAIN, JavaFontSize));
function env = localGetEnvironment(H)
    % 160 167
    % 161 167
    % 162 167
    % 163 167
    % 164 167
    % 165 167
    wholeEnv = mech_envDialog(H, 'getenv');
    env = wholeEnv.Visualization;
function valStr = localToString(ctrls)
    % 169 175
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    AnimationType = 'matlab graphics';
    ConstructInit = ctrls.ConstructInit.getState;
    BodyShape = ctrls.BodyShape.getSelectedIndex;
    ShapeFile = '';
    UpdateImmediate = ctrls.UpdateImmediate.getSelectedIndex;
    AnimateSim = ctrls.AnimateSim.getState;
    % 180 182
    valStr = horzcat(num2str(AnimationType), '|', num2str(ConstructInit), '|', num2str(BodyShape), '|', ShapeFile, '|', num2str(UpdateImmediate), '|', num2str(AnimateSim));
    % 182 187
    % 183 187
    % 184 187
    % 185 187
function env = localFromString(H, params)
    % 187 194
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    ControlLabels = getControlLabels;
    % 194 196
    env.AnimationType = 'matlab graphics';
    env.ConstructInit = params.constructInit;
    env.BodyShape = ControlLabels.shapeOPTS{plus(params.bodyShape, 1.0)};
    env.ShapeFile = params.shapeFile;
    env.UpdateImmediate = params.update;
    env.AnimateSim = params.animate;
function ControlLabels = getControlLabels
    % 202 208
    % 203 208
    % 204 208
    % 205 208
    % 206 208
    ControlLabels.PromptLabels = {'Draw machine using:','Draw machine in initial state','Represent bodies as:','Update machine:','Animate machine during simulation'};
    % 208 216
    % 209 216
    % 210 216
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    ControlLabels.shapeOPTS = {'Convex hulls','Equivalent ellipsoids','User-defined'};
    % 216 222
    % 217 222
    % 218 222
    % 219 222
    % 220 222
    ControlLabels.updateOPTS = {'Only at Update diagram','When diagram changes'};
    % 222 225
    % 223 225
