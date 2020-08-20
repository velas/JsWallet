#!/usr/bin/env node

require('magicli')({
	pipes: {
		after: result => JSON.stringify(result, null, 4)
	}
});