'use strict';

describe('Service: TournamentService', function () {

  // load the service's module
  beforeEach(module('fifaKingsV2App'));

  // instantiate service
  var TournamentService;
  beforeEach(inject(function (_TournamentService_) {
    TournamentService = _TournamentService_;
  }));

  it('should do something', function () {
    expect(!!TournamentService).toBe(true);
  });

});
