/**
 * Created by ZexRon on 2015/9/5.
 */

/**
 * 工具组
 *
 * @type {{console}} 用于log对象，由于ie9的浏览器bug，默认不输出log
 */
var myUtils = function () {
  var showConsole = false;

  function parse_url ( _url ) {
    var pattern = /(\w+)=(\w+)/ig,
      parames = {};
    _url.replace( pattern, function ( a, b, c ) {
      parames[b] = c;
    } );
    return parames;
  }

  return {
    console: {
      setup: function () {
        if ( arguments.length ) {
          showConsole = arguments[0];
        } else {
          return showConsole;
        }
      },
      log: function ( target, logs ) {
        if ( showConsole ) {
          console.group();
          console.info( target );
          console.log( logs );
          console.groupEnd();
        }
      }
    },
    parse_url: parse_url
  }
}();

$( document ).ready( function () {
  var $erweima = $( '.erweima' ).data( 'show', false );
  //link action binding
  $( '.link-action' ).each( function () {
    var $self = $( this );
    if ( $self.data( 'href' ) ) {
      $self.on( 'click', function ( e ) {
        e.preventDefault();
        window.location.href = $self.data( 'href' );
      } )
    }
  } );

  $( '.icon-share-wechat' )
    .on( 'mouseenter', function () {
      $erweima.stop( true, false ).fadeIn( 500 );
    } )
    .on( 'mouseleave', function () {
      $erweima.stop( true, false ).fadeOut( 500 );
    } )
    .on( 'touchstart', function () {
      if ( $erweima.data( 'show' ) ) {
        $erweima.data( 'show', false ).stop( true, false ).fadeOut( 500 );
      } else {
        $erweima.data( 'show', true ).stop( true, false ).fadeIn( 500 );
      }
    } );

  bindSearch( $( '.search-group #words' ), $( '.search-group .icon-search' ) );
} );

function bindSearch ( $input, $button ) {
  function handle ( value ) {
    $input.parents( 'form' )[0].submit();
  }

  $input.on( 'keydown', function ( e ) {
    var value = $( this )[0].value;
    if ( e.keyCode == 13 && value.length > 0 ) {
      handle( value );
    }
  } );

  $button.on( 'click', function () {
    var value = $input[0].value;
    if ( $input[0].value.length > 0 ) {
      handle( value );
    }
  } );
}

function Banner ( $el ) {
  var length = $el.find( '.banner-container' ).length - 2,
    $wrapper = $el.find( '.banner-wrapper' ),
    $pagination = $el.find( '.banner-pagination' ),
    $pagiAuto = $el.find( '.pagination-auto' ),
    $pagiIndex = $el.find( '.pagination-action' ),
    curr = 1,
    autoplayInterval,
    state = true;

  $wrapper.css( {
    'left': '-960px',
    'width': 960 * (length * 2) + 'px'
  } );
  function autoplay () {
    $pagiAuto.addClass( 'icon-sets-pagination-pause' ).removeClass( 'icon-sets-pagination-play' );
    autoplayInterval = setInterval( function () {
      curr++;
      $wrapper.animate( {
        'left': -960 * curr
      }, 1000, function () {
        if ( curr == length + 1 ) {
          $wrapper.css( 'left', '-960px' );
          curr = 1;
        }
        $pagiIndex.removeClass( 'icon-sets-pagination-active' ).addClass( 'icon-sets-pagination-normal' );
        $( $pagiIndex[curr - 1] ).removeClass( 'icon-sets-pagination-normal' ).addClass( 'icon-sets-pagination-active' );
      } );
    }, 3000 );
  }

  function stopautoplay () {
    clearInterval( autoplayInterval );
    $pagiAuto.removeClass( 'icon-sets-pagination-pause' ).addClass( 'icon-sets-pagination-play' );
  }

  autoplay();

  //bindings
  $pagiAuto.on( 'click', function () {
    if ( state ) {
      stopautoplay();
    } else {
      autoplay();
    }
    state = !state;
  } );

  $pagiIndex.on( 'click', function () {
    var index = $( this ).index();
    if ( state ) {
      stopautoplay();
    }
    curr = index;
    $pagiIndex.removeClass( 'icon-sets-pagination-active' ).addClass( 'icon-sets-pagination-normal' );
    $( $pagiIndex[curr - 1] ).removeClass( 'icon-sets-pagination-normal' ).addClass( 'icon-sets-pagination-active' );
    $wrapper.animate( {
      'left': -960 * index
    }, 1000 );
    state = false;
  } );

  return {
    length: length,
    active: curr,
    autoplay: autoplay,
    stopAutoplay: stopautoplay
  }
}

function Swipe ( $el, options ) {
  var defaultParam = {
      width: 960,
      speed: 5000
    },
    length = $el.find( '.banner-wrapper li' ).length - 1,
    $wrapper = $el.find( '.banner-wrapper' ),
    $pagination = $el.find( '.banner-control' ),
    $iconAuto = $el.find( '.icon-banner-play' ),
    curr = 0, state = true,
    param = {}, autoplayInterval, $iconPagi;

  for ( var k in defaultParam ) {
    param[k] = options[k] || defaultParam[k];
  }

  $wrapper.css( {
    'width': (length + 1) * param.width,
    'left': 0
  } );

  for ( var i = 0; i < length; i++ ) {
    $pagination.append( '<a class="icon icon-banner icon-banner-pagination" href="javascript:;"></a>' );
  }

  $iconPagi = $pagination.find( '.icon-banner-pagination' );

  $iconPagi.eq( 0 ).addClass( 'active' );

  function autoplay () {
    $iconAuto.addClass( 'playing' );
    autoplayInterval = setInterval( function () {
      curr++;
      $wrapper
        .stop( true, false )
        .animate( {
          'left': -param.width * curr
        }, 1000, function () {
          if ( curr == length ) {
            $wrapper.css( 'left', 0 );
            curr = 0;
          }
          $pagination.find( '.active' ).removeClass( 'active' );
          $iconPagi.eq( curr ).addClass( 'active' );
        } );

    }, param.speed );
  }

  function stop () {
    clearInterval( autoplayInterval );
    $iconAuto.removeClass( 'playing' );
  }

  autoplay();

  //bindings
  $iconAuto.on( 'click', function () {
    if ( state ) {
      stop();
    } else {
      autoplay();
    }
    state = !state;
  } );

  $iconPagi.on( 'click', function () {
    var $self = $( this ),
      index = $self.index( '.icon-banner-pagination' );

    state = false;
    stop();

    curr = index;

    $pagination.find( '.active' ).removeClass( 'active' );
    $iconPagi.eq( curr ).addClass( 'active' );

    $wrapper.stop( true, false ).animate( {
      'left': -param.width * index
    }, 1000 );

    //setTimeout( autoplay, 2000 );
  } );
}