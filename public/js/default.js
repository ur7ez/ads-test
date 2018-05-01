function loadData(e) {
    let id = e.target.id;
    let allowedClass = [
        'clickable-pagelink',
        'card-title',
        'card-link',
        'edit-adv',
        'delete-adv',
    ];
    let allowedID = [
        'create-ad',
        'user-logout',
        'nav-home'
    ];

    let target = document.querySelector('main .content');   // default target for response data content update

    if (allowedID.includes(id)) {  // check for allowed ID's
        document.querySelectorAll('.nav .btn').forEach(item => {
            (item.id !== id) ? item.classList.remove('active') : item.classList.add('active');
        });
        if (id === 'user-logout') target = document.body;
    } else {                // check for allowed classes
        let chk = false;
        for (let i = 0; i < allowedClass.length; i++) {
            if (e.target.classList.contains(allowedClass[i])) {
                chk = true;
                break;
            }
        }
        if (!chk) return;
        if (e.target.classList.contains('delete-adv')) target = document.body;
    }

    e.preventDefault();
    e.stopPropagation();

    if (e.target.classList.contains('delete-adv') && !confirm('Are you sure to delete this Ad from database ???')) {
        return;
    }

    let old_alert = document.querySelector('.my-custom-alert');
    if (old_alert) old_alert.parentNode.removeChild(old_alert);

    let url = e.target.href;
    let salt = url.includes('?') ? '&transport=xhr' : '?transport=xhr';

    fetch(url + salt, {
        method: 'GET',
        credentials: 'same-origin'  // cross-origin requests: 'include'
    })
        .then(response => {
            if (response.redirected) url = '/';
            if (response.headers.get('Content-Type').includes('text/html')) {
                return response.text();
            } else {
                return response.json();
            }
        })
        .then(data => {
            target.innerHTML = data;
            let script = document.querySelector('.content script');
            if (script) {
                let scriptEl = document.createElement('script');
                scriptEl.src = script.src;
                document.body.appendChild(scriptEl);
                script.parentElement.removeChild(script);
            }
            history.pushState({url}, '', url);
        });
}

document.body.addEventListener('click', loadData);
// document.querySelector('.menu').addEventListener('click', loadData);