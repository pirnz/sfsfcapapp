using CatalogService as service from '../../srv/catalog-service';

annotate CatalogService.Candidates with @(
UI: {
    SelectionFields : [
        candidateId,
        country,
        firstName,
        lastName,
        zip
    ],
    LineItem : {
        $value: [
        {Value: candidateId},
        {Value: country},
        {Value: firstName},
        {Value: lastName},
        {Value: zip}
        ]
    }
}
){
    candidateId @title : 'Candidate ID';
    firstName @title : 'First Name';
    lastName @title : 'Last Name';
    cellPhone @title : 'Cell Phone';
    city @title : 'City';
    zip @title : 'Zip Code';
    country @title : 'Country';
};
