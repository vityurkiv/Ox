#include "OxApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

template<>
InputParameters validParams<OxApp>()
{
  InputParameters params = validParams<MooseApp>();

  params.set<bool>("use_legacy_uo_initialization") = false;
  params.set<bool>("use_legacy_uo_aux_computation") = false;
  params.set<bool>("use_legacy_output_syntax") = false;

  return params;
}

OxApp::OxApp(InputParameters parameters) :
    MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  ModulesApp::registerObjects(_factory);
  OxApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ModulesApp::associateSyntax(_syntax, _action_factory);
  OxApp::associateSyntax(_syntax, _action_factory);
}

OxApp::~OxApp()
{
}

// External entry point for dynamic application loading
extern "C" void OxApp__registerApps() { OxApp::registerApps(); }
void
OxApp::registerApps()
{
  registerApp(OxApp);
}

// External entry point for dynamic object registration
extern "C" void OxApp__registerObjects(Factory & factory) { OxApp::registerObjects(factory); }
void
OxApp::registerObjects(Factory & factory)
{
}

// External entry point for dynamic syntax association
extern "C" void OxApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { OxApp::associateSyntax(syntax, action_factory); }
void
OxApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}
