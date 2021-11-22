const debug = require('debug')('srv:catalog-service');

module.exports = cds.service.impl(async function () {

    const sfrcm = await cds.connect.to('RCMCandidate');

    const {
            Candidates
          } = this.entities;






    this.on('READ', Candidates, async (req) => {
        try {
            const tx = sfrcm.transaction(req);
            return await tx.send({
                query: req.query,
                headers: {
                    'Application-Interface-Key': process.env.ApplicationInterfaceKey,
                    'APIKey': process.env.APIKeyHubSandbox
                }
            })
        } catch (err) {
            req.reject(err);
        }
    });









    this.on('userInfo', req => {
        let results = {};
        results.user = req.user.id;
        if (req.user.hasOwnProperty('locale')) {
            results.locale = req.user.locale;
        }
        results.scopes = {};
        results.scopes.identified = req.user.is('identified-user');
        results.scopes.authenticated = req.user.is('authenticated-user');
        results.scopes.Viewer = req.user.is('Viewer');
        results.scopes.Admin = req.user.is('Admin');
        return results;
    });

});