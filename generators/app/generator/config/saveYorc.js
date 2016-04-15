/**
 * Save configuration to yo-rc.json file
 */

'use strict';

var saveConfig = function saveConfig() {
    var self = this;

    this.config.set('installedMain', true);
    this.config.set(this.answers);


};

module.exports = saveConfig;