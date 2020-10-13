"use strict";

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

const React = require("react");

const {
  useCallback
} = React;

const MiddleEllipsisComponent = props => {
  var onResize = null;

  const prepEllipse = node => {
    const parent = node.parentNode;
    if (!parent) {
      window.removeEventListener("resize", onResize);
      return;
    }
    const child = parent.querySelector(".constrainedChild")
    /* Legacy. */
    || node.childNodes[0];
    const txtToEllipse = parent.querySelector(".ellipseMe") || parent.querySelector(".constrainedEllipse")
    /* Legacy. */
    || child;

    if (child !== null && txtToEllipse !== null) {
      // (Re)-set text back to data-original-text if it exists.
      if (txtToEllipse.hasAttribute("data-original")) {
        txtToEllipse.textContent = txtToEllipse.getAttribute("data-original");
      }

      ellipse( // Use the smaller width.
      node.offsetWidth > parent.offsetWidth ? parent : node, child, txtToEllipse);
    }
  },
        measuredParent = node => {
    if (node !== null) {
      onResize && window.removeEventListener("resize", onResize);

      onResize = () => prepEllipse(node);

      window.addEventListener("resize", onResize);
      prepEllipse(node);
    }
  };

  return /*#__PURE__*/React.createElement("div", {
    ref: measuredParent,
    style: _objectSpread({
      wordBreak: "keep-all",
      overflowWrap: "normal"
    }, props.width && {
      width: props.width
    })
  }, props.children);
};

const ellipse = (parentNode, childNode, txtNode) => {
  const childWidth = childNode.offsetWidth;
  const containerWidth = parentNode.offsetWidth;
  const txtWidth = txtNode.offsetWidth;
  const targetWidth = childWidth > txtWidth ? childWidth : txtWidth;

  if (targetWidth > containerWidth) {
    const str = txtNode.textContent;
    const txtChars = str.length;
    const avgLetterSize = txtWidth / txtChars;
    const canFit = (containerWidth - (targetWidth - txtWidth)) / avgLetterSize;
    const delEachSide = (txtChars - canFit + 5) / 2;
    const endLeft = Math.floor(txtChars / 2 - delEachSide);
    const startRight = Math.ceil(txtChars / 2 + delEachSide);
    txtNode.setAttribute("data-original", txtNode.textContent);
    txtNode.textContent = str.substr(0, endLeft) + "..." + str.substr(startRight);
  }
};

module.exports = MiddleEllipsisComponent;
