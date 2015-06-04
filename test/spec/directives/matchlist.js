'use strict';

describe('Directive: MatchList', function () {

  // load the directive's module
  beforeEach(module('fifaKingsV2App'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<-match-list></-match-list>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the MatchList directive');
  }));
});
