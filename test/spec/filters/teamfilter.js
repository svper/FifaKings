'use strict';

describe('Filter: TeamFilter', function () {

  // load the filter's module
  beforeEach(module('fifaKingsV2App'));

  // initialize a new instance of the filter before each test
  var TeamFilter;
  beforeEach(inject(function ($filter) {
    TeamFilter = $filter('TeamFilter');
  }));

  it('should return the input prefixed with "TeamFilter filter:"', function () {
    var text = 'angularjs';
    expect(TeamFilter(text)).toBe('TeamFilter filter: ' + text);
  });

});
