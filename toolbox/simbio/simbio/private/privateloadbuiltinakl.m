function privateloadbuiltinakl
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    try
        % 17 18
        akl = SimBiology.AbstractKineticLaw('Unknown', 'Unknown', 'Notes', localGetUnknownNotes);
        % 19 21
        % 20 21
        akl.register(-1.0, true);
        % 22 23
        akl = SimBiology.AbstractKineticLaw('MassAction', 'MassAction', 'Annotation', 'http://www.mathworks.com/access/helpdesk/help/toolbox/simbio/ref/expression.html', 'Notes', localGetMassActionNotes);
        % 24 27
        % 25 27
        % 26 27
        akl.register(-1.0, true);
        % 28 30
        % 29 30
        akl = SimBiology.AbstractKineticLaw('Henri-Michaelis-Menten', 'Vm*S/(Km + S)', 'ParameterVariables', {'Vm','Km'}, 'SpeciesVariables', {'S'}, 'Notes', localGetHenriMichaelisMentenNotes);
        % 31 34
        % 32 34
        % 33 34
        akl.register(-1.0, true);
        % 35 37
        % 36 37
        akl = SimBiology.AbstractKineticLaw('Henri-Michaelis-Menten-Reversible', '(Vmf*S/Ks - Vmr*P/Kp)/(1 + S/Ks + P/Kp)', 'ParameterVariables', {'Vmf','Ks','Vmr','Kp'}, 'SpeciesVariables', {'S','P'}, 'Notes', localGetMichaelisMentenReversibleNotes);
        % 38 42
        % 39 42
        % 40 42
        % 41 42
        akl.register(-1.0, true);
        % 43 45
        % 44 45
        akl = SimBiology.AbstractKineticLaw('Hill-Kinetics', 'Vm*S^n/(Kp + S^n)', 'ParameterVariables', {'Vm','n','Kp'}, 'SpeciesVariables', {'S'}, 'Notes', localGetHillKineticsNotes);
        % 46 50
        % 47 50
        % 48 50
        % 49 50
        akl.register(-1.0, true);
        % 51 53
        % 52 53
        akl = SimBiology.AbstractKineticLaw('Iso-Uni-Uni', 'Vmf*(S - P/Keq)/(Kms*(1 + P/Kmp) + S*(1 + P/Kiip))', 'ParameterVariables', {'Vmf','Keq','Kms','Kmp','Kiip'}, 'SpeciesVariables', {'S','P'}, 'Notes', localGetIsoUniUniNotes);
        % 54 58
        % 55 58
        % 56 58
        % 57 58
        akl.register(-1.0, true);
        % 59 61
        % 60 61
        akl = SimBiology.AbstractKineticLaw('Ordered-Bi-Bi', 'Vm/((Ksa*Kmb/(A*B)) + (Kma/A) + (Kmb/B) + 1)', 'ParameterVariables', {'Vm','Ksa','Kmb','Kma'}, 'SpeciesVariables', {'A','B'}, 'Notes', localGetOrderedBiBiNotes);
        % 62 66
        % 63 66
        % 64 66
        % 65 66
        akl.register(-1.0, true);
        % 67 71
        % 68 71
        % 69 71
        % 70 71
        akl = SimBiology.AbstractKineticLaw('Ping-Pong-Bi-Bi', 'Vm/((Kma/A) + (Kmb/B) + 1)', 'ParameterVariables', {'Vm','Kma','Kmb'}, 'SpeciesVariables', {'A','B'}, 'Notes', localPingPongBiBiNotes);
        % 72 76
        % 73 76
        % 74 76
        % 75 76
        akl.register(-1.0, true);
        % 77 78
        akl = SimBiology.AbstractKineticLaw('Competitive-Inhibition', 'Vm*S/(Km*(1 + I/Ki) + S)', 'ParameterVariables', {'Vm','Km','Ki'}, 'SpeciesVariables', {'S','I'}, 'Notes', localGetCompetitiveInhibitionNotes);
        % 79 83
        % 80 83
        % 81 83
        % 82 83
        akl.register(-1.0, true);
        % 84 86
        % 85 86
        akl = SimBiology.AbstractKineticLaw('NonCompetitive-Inhibition', 'Vm*S/((Ks + S)*(1 + I/Ki))', 'ParameterVariables', {'Vm','Ks','Ki'}, 'SpeciesVariables', {'S','I'}, 'Notes', localGetNonCompetitiveInhibitionNotes);
        % 87 91
        % 88 91
        % 89 91
        % 90 91
        akl.register(-1.0, true);
        % 92 94
        % 93 94
        akl = SimBiology.AbstractKineticLaw('UnCompetitive-Inhibition', 'Vm*S/(Km + S*(1 + I/Ki))', 'ParameterVariables', {'Vm','Km','Ki'}, 'SpeciesVariables', {'S','I'}, 'Notes', localGetUnCompetitiveInhibitionNotes);
        % 95 99
        % 96 99
        % 97 99
        % 98 99
        akl.register(-1.0, true);
    catch
        % 101 103
        % 102 103
        % 103 104
        rethrow(lasterror);
    end % try
end % function
function notes = localGetUnknownNotes
    % 108 112
    % 109 112
    % 110 112
    % 111 112
    notes = sprintf('<p>Use this kinetic law when you want to specify your own rate equation.  This kinetic law enables you to scope a parameter at the kinetic law level.</p>\n<p>If you import an SBML model that has a parameter in a kinetic law, SimBiology assigns �Unknown� kinetic law to the reaction and scopes the parameter to this kinetic law. </p>');
end % function
function notes = localGetMassActionNotes
    % 115 118
    % 116 118
    % 117 118
    notes = sprintf('<p>The exact expression of a reaction using MassAction kinetic law varies depending upon the number of reactants. Thus, for mass action kinetics the Expression property is set to MassAction. In general for mass action kinetics the reaction rate is defined as described in the documentation for the Expression property. </p>\n\n<p> Use the link in the Annotation property of the MassAction kinetic law (http://www.mathworks.com/access/helpdesk/help/toolbox/simbio/ref/expression.html) to access this description.</p>');
end % function
function notes = localGetHenriMichaelisMentenNotes
    % 121 124
    % 122 124
    % 123 124
    notes = sprintf('\n<p> Where:<p/>\n<p> Vm = Vmax = maximum velocity</p>\n<p> S = substrate concentration </p>\n<p> Km = Michaelis constant </p>\n\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 2 Eq. II-3</p>\n<p>See Also</p>\n<p>Lehninger, Albert L., <i>Biochemistry - The Molecular Basis of Cell Structure and Function, Second Edition, Worth Publishers,</i> Chapter 8 Enzymes: kinetics and inhibition.</p>');
end % function
function notes = localGetMichaelisMentenReversibleNotes
    % 127 129
    % 128 129
    notes = sprintf('<p>This expression assumes two central complexes; ( E + S <-> ES <-> EP <-> E + P) </p>\n<p> Where </p>\n<p> Vm = Vmaxf = maximum velocity of the forward reaction </p>\n<p> S = substrate concentration </p>\n<p> Ks =   dissociation constant of the ES complex (E*S/ES)\n<p> Vmr = Vmaxr = maximum velocity of the reverse reaction </p>\n<p> P = product concentration </p>\n<p> Kp =  dissociation constant of the EP complex (E*P/EP)</p>\n\n<p> You can substitute Ks with Kms, and Kp with Kmp to derive the expression for the assumption of one central complex.</p>\n<p>(Where Kms = Michaelis constant for the substrate,</p> <p> and Kmp = Michaelis constant for the product).</p>\n\n<b>Reference</b>\n<br>\nSegel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 2 Eq.II-17\n<p>See Also Chapter2 Eq. II-16.</p>\n');
end % function
function notes = localGetHillKineticsNotes
    % 132 135
    % 133 135
    % 134 135
    notes = sprintf('<p>Expression is V= Vm*S^n/ (K'' + S^n)</p>\n<p>Where </p>\n<p> Vm = Vmax = maximum velocity</p>\n<p> S = substrate concentration </p>\n<p>n = number of substrate binding sites per enzyme molecule</p>\n<p>Kp = K'' = Ks^n(a^n-1*b^n-2*c^n-3...z^1)</p>\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>,  John Wiley and Sons, 1975, Chapter 7 Eq. VII-22.</p>\n');
end % function
function notes = localGetIsoUniUniNotes
    % 138 141
    % 139 141
    % 140 141
    notes = sprintf('\n<p>For Membrane Transport Systems</p>\n\n<p>Where,</p>\n<p>Vmf  =  maximum velocity of the forward reaction (transport);</p>\n<p>S = substrate being transported</p>\n<p>P =  transported "product"</p>\n<p>Keq = equilibrium constant </p>\n<p>Kms = substrate Michaelis constant</p>\n<p>Kmp = product Michaelis constant</p>\n<p>Kiip =  product isoinhibition constant;</p>\n\n\n\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 9 Eq. IX-47.</p>');
end % function
function notes = localGetOrderedBiBiNotes
    % 144 146
    % 145 146
    notes = sprintf('<p>Where,</p>\n<p>Vm  =  maximum velocity</p>\n<p>Ksa =  dissociation constant for enzyme-A complex (E*A/EA)</p>\n<p>Kmb = Michaelis constant for B</p>\n<p>  A = Concentration of first bound substrate</p>\n<p>  B = Concentration of second bound substrate</p>\n<p>Kma =  Michaelis constant for A</p>\n\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, 1975, Chapter 9 Eq. IX-89</p>\n\n<p>See Also</p>\n<p>Lehninger, Albert L., <i>Biochemistry - The Molecular Basis of Cell Structure and Function, Second Edition, Worth Publishers,</i> Chapter 8 Enzymes: kinetics and inhibition.</p>\n');
end % function
function notes = localPingPongBiBiNotes
    % 149 152
    % 150 152
    % 151 152
    notes = sprintf('\n<p>Where,</p>\n<p>Vm  =  maximum velocity</p>\n<p>Kma =  Michaelis constant for A</p>\n<p>A = Concentration of substrate A</p>\n<p>B = Concentration of substrate B</p>\n<p>Kmb =  Michaelis constant for B</p>\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, 1975, Chapter 9 Eq. IX-142</p>\n\n<p>See Also</p>\n<p>Lehninger, Albert L., <i>Biochemistry - The Molecular Basis of Cell Structure and Function, Second Edition, Worth Publishers,</i> Chapter 8 Enzymes: kinetics and inhibition.</p>');
end % function
function notes = localGetCompetitiveInhibitionNotes
    % 155 157
    % 156 157
    notes = sprintf('<p>For steady state assumptions</p>\n<p> Where:<p/>\n<p> Vm = Vmax = maximum velocity</p>\n<p> S = substrate concentration </p>\n<p> Km = Michaelis constant </p>\n<p> I = inhibitor concentration</p>\n<p> Ki = dissociation constant of the enzyme-inhibitor complex (E*I/EI) </p>\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 3 Eq. III-2.</p>');
end % function
function notes = localGetNonCompetitiveInhibitionNotes
    % 160 162
    % 161 162
    notes = sprintf('<p>For rapid equilibrium assumptions</p>\n<p> Where:<p/>\n<p>Vm = Vmax = maximum velocity</p>\n<p> S = substrate concentration</p>\n<p>Ks = dissociation constant of the enzyme-substrate complex (E*S/ES)</p>\n<p> I = inhibitor concentration</p>\n<p>Ki = dissociation constant of the enzyme-inhibitor complex (E*I/EI) </p>\n\n<b> Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 3 Eq. III-21.</p>');
end % function
function notes = localGetUnCompetitiveInhibitionNotes
    % 165 167
    % 166 167
    notes = sprintf('<p>For steady state assumptions</p>\n<p> Where:<p/>\n<p>Vm = Vmax = maximum velocity</p>\n<p> S = substrate concentration </p>\n<p>Km = Michaelis constant </p>\n<p> I = inhibitor concentration</p>\n<p>Ki = dissociation constant of the enzyme-inhibitor complex (E*I/EI) </p>\n\n<b>Reference</b>\n<p>Adapted from Segel, Irwin H., <i>Enzyme Kinetics - Behavior of Rapid Equilibrium and Steady-State Enzyme Systems</i>, John Wiley and Sons, 1975, Chapter 3 Eq.III-32.</p>\n');
end % function
