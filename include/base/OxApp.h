#ifndef OXAPP_H
#define OXAPP_H

#include "MooseApp.h"

class OxApp;

template<>
InputParameters validParams<OxApp>();

class OxApp : public MooseApp
{
public:
  OxApp(InputParameters parameters);
  virtual ~OxApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* OXAPP_H */
