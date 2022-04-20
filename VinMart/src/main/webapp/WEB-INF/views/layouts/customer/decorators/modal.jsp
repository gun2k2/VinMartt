 <style type="text/css">
     		.modal-content {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: .3rem;
    outline: 0;
}
.modal-header {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 15px;
    border-bottom: 1px solid #e9ecef;
    border-top-left-radius: 4.8px;
    border-top-left-radius: .3rem;
    border-top-right-radius: 4.8px;
    border-top-right-radius: .3rem;
}
.modal-body {
    position: relative;
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 15px;
}
.modal-footer {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: end;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 15px;
    border-top: 1px solid #e9ecef;
}
.btn-secondary {
    color: #fff;
    background-color: #868e96;
    border-color: #868e96;
}
.modal-header .close {
    padding: 15px;
    margin: -15px -15px -15px auto;
}
.modal-title {
    margin-bottom: 0;
    line-height: 1.5;
}
.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1050;
    display: none;
    outline: 0;
}

.modal.fade .modal-dialog {
    -webkit-transition: -webkit-transform .3s ease-out;
    transition: -webkit-transform .3s ease-out;
    -o-transition: transform .3s ease-out;
    transition: transform .3s ease-out;
    transition: transform .3s ease-out,-webkit-transform .3s ease-out;
    -webkit-transform: translateY(-25%);
    -ms-transform: translateY(-25%);
    transform: translateY(-25%);
}
.fade.show {
    opacity: 1;
}

     	</style>
     	<style>
     	[type="checkbox"]:not(:checked)+label, [type="checkbox"]:checked+label {
		    position: relative;
		    padding-left: 1.95em;
		    cursor: pointer;
		    line-height: 19px;
		}
     	
		[type="checkbox"]:not(:checked)+label:before, [type="checkbox"]:checked+label:before {
		    content: '';
		    position: absolute;
		    left: 0;
		    top: 0;
		    width: 16px;
		    height: 16px;
		    border: 1px solid #008848;
		    background: #fff;
		    border-radius: 4px;
		}
		[type="checkbox"]:not(:checked)+label:after {
		    opacity: 0;
		    transform: scale(0);
		}
		[type="checkbox"]:not(:checked)+label:after, [type="checkbox"]:checked+label:after {
		    content: '';
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 18px;
		    height: 18px;
		    background-image: url(//cdn.tgdd.vn/bachhoaxanh/www/Content/images/sprite@2x-checkout.v202104162153.png);
		    background-size: 280px auto;
		    background-position: -9px -116px;
		    background-repeat: no-repeat;
		    display: inline-block;
		    vertical-align: middle;
		    border-radius: 4px;
		    background-color: #008848;
		}
		 li .reason {
		    height: 65px;
		    width: 100%;
		    overflow: hidden;
		    border: 1px solid #d9d9d9;
		    border-radius: 4px;
		    padding: 10px;
		    resize: none;
		    box-sizing: border-box;
		}
     	</style>