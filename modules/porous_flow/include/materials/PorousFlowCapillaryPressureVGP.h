/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#ifndef POROUSFLOWCAPILLARYPRESSUREVGP_H
#define POROUSFLOWCAPILLARYPRESSUREVGP_H

#include "PorousFlowCapillaryPressureBase.h"

//Forward Declarations
class PorousFlowCapillaryPressureVGP;

template<>
InputParameters validParams<PorousFlowCapillaryPressureVGP>();

/**
 * van Genuchten capillary pressure for multiphase flow in porous media.
 * Note: this formulation is in terms of pore pressure, not saturation
 *
 * Based on van Genuchten, M. Th., A closed for equation for
 * predicting the hydraulic conductivity of unsaturated soils,
 * Soil Sci. Soc., 44, 892-898 (1980).
 */
class PorousFlowCapillaryPressureVGP : public PorousFlowCapillaryPressureBase
{
public:
  PorousFlowCapillaryPressureVGP(const InputParameters & parameters);

protected:
  virtual void computeQpProperties();

  /// Effective phase saturation as a function of phase pore pressure
  Real effectiveSaturation(Real pressure) const;

  /// Derivative of effective saturation wrt phase pore pressure
  Real dEffectiveSaturation(Real pressure) const;

  /// Second derivative of effective saturation wrt phase pore pressure
  Real d2EffectiveSaturation(Real pressure) const;

  /// Name of (dummy) pressure primary variable
  VariableName _pressure_variable_name;

  /// Pressure material property at the nodes
  const MaterialProperty<std::vector<Real> > & _porepressure_nodal;

  /// Pressure material property at the qps
  const MaterialProperty<std::vector<Real> > & _porepressure_qp;

  /// Derivative of capillary pressure at the nodes wrt phase pore pressure
  MaterialProperty<Real> & _dcapillary_pressure_nodal_dp;

  /// Second derivative of capillary pressure at the nodes wrt pore pressure
  MaterialProperty<Real> & _d2capillary_pressure_nodal_dp2;

  /// van Genuchten alpha parameter
  const Real _al;

  /// van Genuchten exponent m
  const Real _m;
};

#endif //POROUSFLOWCAPILLARYPRESSUREVGP_H
