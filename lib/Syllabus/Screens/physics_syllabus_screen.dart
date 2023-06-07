import 'package:flutter/material.dart';

import '../widgets.dart';

class PhysicsSyllabus extends StatelessWidget {
  const PhysicsSyllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor:Colors.white,
        title: Text('Syllabus(Physics-45 Marks)'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, bottom: 20, right: 5),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SyllabusSubtitle("Mechanics:"),
              const  Text(
                  'Dimensions, Equations of motion, Motion of projectile. Laws of motion, Addition and subtraction of vectors, Relative velocity, Equilibrium of forces, Moments, Centre of mass, Centre of gravity, Solid friction, Work, power and energy, Conservation of energy, Angular speed, Centripetal force, Moment of inertia, Torque on a body, Angular momentum, Rotational kinetic energy, Laws of gravitation, Gravitational intensity, Gravitations potential, Velocity of escape, Simple harmonic motion, Energy of SHM, Hooke\'s Law, Breaking stress, Modules of elasticity, Energy stored in stretched wire, Surface tension phenomenon, Surface energy, Capillarity, Fluid pressure, Pascal law of transmission of fluid pressure, Archimedes\' principle, Flotation Stokes\' law, Terminal velocity.',
                ),
               SyllabusSubtitle("Heat:"),
             const   Text('Heat and temperature, Temperature scale, Measurement of heat energy, Specific heat capacity, Latent heat, Saturated and Unsaturated vapour, Relative humidity and dew point, First law of thermodynamics, Reversible isothermal and adiabatic changes, Gas laws, Kinetic theory of gasses, second law of thermodynamics, Carnot\'s engine, Transfer of heat, Conduction, Convection and radiation, Expansion of solid, liquid and gas.',),
                SyllabusSubtitle('Optics:'),
                Text('Formation of images by plane and curves mirrors, Refraction of light through plane surfaces. Total internal reflection, Critical angle, Refraction through prism, Maximum and minimum deviation, formation of images by lenses, Dispersion, Achrormatic combination of lenses visual angle, Angular magnification Defect of vision, Telescope and microscope, Wave theory of light: introduction to Huygen\'s principle and its application interference diffraction and polarization of light.',),
                SyllabusSubtitle('Sound:'),
                Text('Damped vibration, Forced oscillation, Resonance, Progressive waves, Principle of superposition, Velocity of sound in solid, liquid and gas: Laplace\'s correction, Characteristics of Sound wave, Beat phenomenon, Doppler effect, Stationary waves, Waves in pipes, Waves in String.',),
                SyllabusSubtitle('Electricty:'),
                Text('Electric Charge, Gold leaf electroscope, Charging by induction Faraday\'s ice pail experiment, Coulomb\'s law, Permitivity, Electric field, Gauss\'s law and its application, electric potential, Capacitors, Ohm\'s law, Resistance combination of resistances, emf, Kirchhoff\'s law and its application, Heating effect of current, Thermoelectricity, Chemical effect of current, Potentiometer, Wheatstone bridge, Galvanometer, Conversion of galvanometer into voltmeter and ammeter. Magnetic Field, Earth\'s magnetism, Magnetic Flux, Force on a current carrying conductor, Ampere\'s law, Biot-Savart\'s law and their applications, Solenoid, Electromagnetic induction, AC circuits.',),
                SyllabusSubtitle('Atomic Physics and Electronics:'),
                Text('Discharge electricity through gases, Cathode rays, Electronic mass and charge Bohr\'s theory of atomic structure, Energy level, X-rays, Photoelectric effect Radioactivity, Nuclear-fission and fusion,Semiconductors, Junction Transistor.',),
              ],
            )
          ],
        ),
      ),
    );
  }
}


