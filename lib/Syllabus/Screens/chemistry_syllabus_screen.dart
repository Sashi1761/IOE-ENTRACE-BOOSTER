import 'package:flutter/material.dart';

import '../widgets.dart';

class ChemistrySyllabus extends StatelessWidget {
  const ChemistrySyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Syllabus(Chemistry)'),
        centerTitle: true,
        backgroundColor:Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10,top: 15, bottom: 20, right: 5),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SyllabusSubtitle("Language of Chemistry & Physical Chemistry:"),
                Text(
                  'Symbols, formulate valency and chemical questions, Problems based on chemical equations (relation with weight and weight, and weight and volume.',
                ),
                SyllabusSubtitle('Atomic Structure:'),
                Text(
                  'Study of Cathode rays, and discovery of electrons, Rutheford\'s X-ray scattering experiment and discovery of nucleus. Rutheford model of atom., Bohr model of atom, Elementary concept of quantum numbers, Electron configuration of the elements.',
                ),
                SyllabusSubtitle('Electronics Theory of Valency:'),
                Text(
                  'Octet rule, Electrovalency, covalency and coordicate valency, General characteristics ionic and covalent compounds.',
                ),
                SyllabusSubtitle('Oxidation and Reduction:'),
                Text(
                  'Classical definitions, Electronic interpretations of oxidation and reduction, Balancing of redox equations by oxidation number method.',
                ),
                SyllabusSubtitle('Periodic Classification of Elements:'),
                Text(
                  'Mendeleev\'s periodic Law, Periodic Properties viz. Ionization potential, electronegativity and atomic radii, and their variation in the periodic table; Equivalent weight and Atomic: Concept of equivalent weight, and its determination by hydrogen displacement method and oxide method, Concept of atomic weight, equivalent weight and valency, determination of atomic weight using Dulong and Petit\'s rule.',
                ),
                SyllabusSubtitle('Molecular Weight and Mole'),
                Text(
                  'Avogardo\'s hypothesis and its deductions, Avogadro number and concept of mole, Determination of molecular weight by Victor Meyer\'s method; Electro-Chemistry; Electrolytes and non-electrolytes, strong electrolytes and weak electrolytes, Faraday\'s laws of electrolysis, Solubility product principle and its application in qualitative analysis; Theories of Acids and Bases: Arrhenius theory, Bronsted and Lowry theory, Lewis theory; Volumetric Analysis Equivalent weights of acids, base and salts, Principles of acidimetry and alkalimetry, pH and pH scale.',
                ),
                SyllabusSubtitle('Non-Metals:'),
                Text(
                  'Water: Hard water and soft water, Causes and removal of hardness of water; Nitrogen and its Compounds: Nitrogen cycle, Preparation of ammonia and nitric acid in the lab, and their properties, Manufacture of ammonia and nitric and, Sulphur and its Compound. Allotropy of sulphur, Preparation of hydrogen sulphide, Sulphur dioxide in the lab, and their properties, Manufacture of sulphuric acid by contact process; Halogens and Their Compound: Position of halogens in the periodic table, Preparation of chlorine and hydrogen chloride in the lab, and their properties. ',
                ),
                SyllabusSubtitle('Metals:'),
                Text(
                  "General methods of preparation and properties of oxides, hydroxides, chlorides, nitrates, sulphates and carbonates of metals; Sodium: Extraction of Sodium (Down\'s process),Manufacture of caustic soda sodium carbonate; Copper: Extraction of copper from copper pyrite, Manufacture of Blue vitriol; Zinc: Extraction of zinc from zinc blend, Galvanization; Iron: Extraction of cast iron from hematite, Cast iron, steel and wrought iron, Types of steel, Manufacture of steel.",
                ),
                SyllabusSubtitle('Organic Chemistry:'),
                Text(
                  'Sources and Purification of organic Compounds: Characteristics of Organic compounds, Sources of organic compounds, Purification of organic compounds; Classification and nomenclature of organic Compounds: Functional group, homologous series, and isomerism (structural only), Classification of organic compounds, Common names, and I.U.P.A.C. naming system.',
                ),
                SyllabusSubtitle(
                    'Saturated and unsaturated Hydrocarbons & Aromatic compound:'),
                Text(
                  'Preparation and properties of methane, Preparation and properties of ethylene and acetylene, Alkyl Halides: Preparation and properties of ethyl iodide; Aromatic Compounds: Structure of benzene, Preparation of benzene in the laboratory, Properties of benzene.',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
