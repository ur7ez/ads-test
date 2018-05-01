function formSaveAd(e) {
    e.stopPropagation();
    e.preventDefault();

    let advForm = document.querySelector('.my-adv-form');
    let data = new FormData(advForm);
    data.set('published', data.has('published') ? '1' : '0');

    let url = e.target.action;
    let salt = '?transport=xhr';
    let target = document.body; // document.querySelector('main .content');

    if (!formDirty(advForm)) {
        // console.log('Form is un-modified!');
        url = url.replace('edit', 'view');
        target = document.querySelector('main .content');
        fetch(url + salt, {
            method: 'GET',
            credentials: 'same-origin'  // cross-origin requests: 'include'
        })
            .then(response => response.json())
            .then(data => {
                target.innerHTML = data;
                history.pushState({url}, '', url);
            });
        return;
    }

    // if we need to send data with encoding 'application/x-www-form-urlencoded' - may use this instead:
    /*
    let data = new URLSearchParams();  // let data = new URLSearchParams(advForm);
    for (const pair of new FormData(advForm)) {
        data.append(pair[0], pair[1]);
    }
    */

    fetch(url + salt, {
        body: data,
        //headers: {
        // "Content-Type": "application/x-www-form-urlencoded",
        //  "Content-Type": "multipart/form-data",
        //},
        method: 'POST',
        credentials: 'same-origin'  // cross-origin requests: 'include'
    })
        .then(response => response.text())
        .then(data => {
            target.innerHTML = data;
            // let c = document.createElement('div');
            // c.className = 'my-custom-alert';
            // c.innerHTML = data;
            // target.parentNode.insertBefore(c, target);
        });
}

/**
 * Determines if a form is dirty by comparing the current value of each element
 * with its default value.
 * @param {Element} form the form to be checked.
 * @return {Boolean} <code>true</code> if the form is dirty, <code>false</code>
 *                   otherwise.
 */
function formDirty(form) {
    for (let i = 0; i < form.elements.length; i++) {
        let element = form.elements[i];
        let type = element.type;
        if (type === "checkbox" || type === "radio") {
            if (element.checked !== element.defaultChecked) {
                return true;
            }
        }
        else if (type === "hidden" || type === "password" ||
            type === "text" || type === "textarea") {
            if (element.value !== element.defaultValue) {
                return true;
            }
        }
        else if (type === "select-one" || type === "select-multiple") {
            for (let j = 0; j < element.options.length; j++) {
                if (element.options[j].selected !==
                    element.options[j].defaultSelected) {
                    return true;
                }
            }
        }
    }
    return false;
}

document.querySelector('.my-adv-form').addEventListener('submit', formSaveAd);