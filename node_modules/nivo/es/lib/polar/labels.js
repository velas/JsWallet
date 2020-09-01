/*
 * This file is part of the nivo project.
 *
 * Copyright 2016-present, Raphaël Benitte.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
import { positionFromAngle, radiansToDegrees } from './utils';
import { textPropsByEngine } from '../bridge';

/**
 * @param {number} radius
 * @param {number} angle          angle (radians)
 * @param {number} [rotation=0]   label rotation (degrees)
 * @param {string} [engine='svg'] one of: 'svg', 'canvas'
 * @return {{ x: number, y: number, rotate: number, align: string, baseline: string }}
 */
export var getPolarLabelProps = function getPolarLabelProps(radius, angle, rotation) {
    var engine = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : 'svg';

    var textProps = textPropsByEngine[engine];

    var _positionFromAngle = positionFromAngle(angle - Math.PI / 2, radius),
        x = _positionFromAngle.x,
        y = _positionFromAngle.y;

    var rotate = radiansToDegrees(angle);
    var align = textProps.align.center;
    var baseline = textProps.baseline.bottom;

    if (rotation > 0) {
        align = textProps.align.right;
        baseline = textProps.baseline.center;
    } else if (rotation < 0) {
        align = textProps.align.left;
        baseline = textProps.baseline.center;
    }

    // reverse labels after 180°
    if (rotation !== 0 && rotate > 180) {
        rotate -= 180;
        align = align === textProps.align.right ? textProps.align.left : textProps.align.right;
    }

    rotate += rotation;

    return { x: x, y: y, rotate: rotate, align: align, baseline: baseline };
};