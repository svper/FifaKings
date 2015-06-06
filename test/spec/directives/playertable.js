'use strict';

describe('Directive: playerTable', function () {

  // load the directive's module
  beforeEach(module('fifaKingsV2App'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<player-table></player-table>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the playerTable directive');
  }));
});
