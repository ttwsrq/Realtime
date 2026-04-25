/**
 * @typedef {Object} Packet
 * @property {string} id
 * @property {string} captured_at
 * @property {string} src_ip
 * @property {string} dst_ip
 * @property {number} src_port
 * @property {number} dst_port
 * @property {string} protocol   // TCP | UDP | HTTP | HTTPS | DNS | SSH
 * @property {string} encryption // TLS1.2 | TLS1.3 | SSL3.0 | NONE
 * @property {number} size_bytes
 * @property {string} status     // captured | analyzed | stored
 */

/**
 * @typedef {Object} Profile
 * @property {string} id
 * @property {string} email
 * @property {string} role       // admin | user
 * @property {string} created_at
 */
