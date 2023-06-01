import 'package:flutter/material.dart';

import '../widgets.dart';

class MathSyllabus extends StatelessWidget {
  const MathSyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syllabus(Math)'),
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
                SyllabusSubtitle("Set and Function:"),
                Text(
                  'Dimensions, Equations of motion, Motion of projectile. Laws of motion, Addition and subtraction of vectors, Relative velocity, Equilibrium of forces, Moments, Centre of mass, Centre of gravity, Solid friction, Work, power and energy, Conservation of energy, Angular speed, Centripetal force, Moment of inertia, Torque on a body, Angular momentum, Rotational kinetic energy, Laws of gravitation, Gravitational intensity, Gravitations potential, Velocity of escape, Simple harmonic motion, Energy of SHM, Hooke\'s Law, Breaking stress, Modules of elasticity, Energy stored in stretched wire, Surface tension phenomenon, Surface energy, Capillarity, Fluid pressure, Pascal law of transmission of fluid pressure, Archimedes\' principle, Flotation Stokes\' law, Terminal velocity.',
                ),
                SyllabusSubtitle("Heat:"),
                Text(
                  'Set and relations, Functions and graphs, Algebraic, Trigonometric, Exponential, Logarithmic and hyperbolic functions and their inverses.',
                ),
                SyllabusSubtitle('Algebra:'),
                Text(
                  'Determinats, matrices, Inverse of a matrix, uses of complex numbers, Polynomial equations, sequence and series, Permutation and combination, Binomial theorem, exponential, Logarithmic series.',
                ),
                SyllabusSubtitle('Trigonometry'),
                Text('Trigonometric equations and general values, Inverse trigonometric functions, Principal values, properties of triangles; Centroid, incentre, Orthocentre and circumcentre and their properties.',),
                SyllabusSubtitle('Calculus:'),
                Text('Limit and continuity of functions, Derivatives and application of derivative-Tangent and normal, Rate of change, differentials dy and actual change Ay. Maxima and Minima of a function; Antiderivatives (Integrations): rule of Integration, Standard Integrals, Definite integral as the limit of a sum. Application to areas under a curve and area between two curves.',),
                SyllabusSubtitle('Vectors:'),
                Text('Vectors in space, addition of vectors, Linear combination of vectors, Linearly dependent and independent set of vectors, Scalar and vector product of two vectors, simple applications.',),
              ],
            )
          ],
        ),
      ),
    );
  }
}
