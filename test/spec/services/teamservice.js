'use strict';

describe('Service: teamService', function () {

  // load the service's module
  beforeEach(module('fifaKingsV2App'));

  // instantiate service
  var teamService;
  beforeEach(inject(function (_teamService_) {
    teamService = _teamService_;
  }));

  it('should do something', function () {
    expect(!!teamService).toBe(true);
  });

});
