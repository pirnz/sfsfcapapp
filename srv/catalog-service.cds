using { RCMCandidate } from './external/RCMCandidate.csn';

service CatalogService @(path : '/catalog')
@(requires: 'authenticated-user')
{
   @readonly
    entity Candidates
      @(restrict: [{ to: 'Viewer' }])
      as projection on RCMCandidate.Candidate {
          candidateId,
          firstName,
          lastName,
          cellPhone,
          city,
          zip,
          country
        };
    type userScopes { identified: Boolean; authenticated: Boolean; Viewer: Boolean; Admin: Boolean; };
    type user { user: String; locale: String; scopes: userScopes; };
    function userInfo() returns user;
};