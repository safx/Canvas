/*
 * This file is part of the Canvas package.
 * (c) Canvas <usecanvas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "CSAnimation.h"

NSString *const CSAnimationExceptionMethodNotImplemented = @"CSAnimationExceptionMethodNotImplemented";

@interface CSAnimation ()


@end

@implementation CSAnimation

@synthesize duration = _duration;
@synthesize delay    = _delay;

static NSMutableDictionary *_animationClasses;

+ (void)load {
    _animationClasses = [[NSMutableDictionary alloc] init];
}

+ (void)performAnimationOnView:(UIView *)view
                      duration:(NSTimeInterval)duration
                         delay:(NSTimeInterval)delay {
    [NSException raise:CSAnimationExceptionMethodNotImplemented format:@"+[%@ performAnimationOnView:duration:delay:] needed to be implemented", NSStringFromClass(self)];
}

+ (void)registerClass:(Class)class forAnimationType:(CSAnimationType)animationType {
    [_animationClasses setObject:class forKey:animationType];
}

+ (Class)classForAnimationType:(CSAnimationType)animationType {
    return [_animationClasses objectForKey:animationType];
}

@end

#pragma mark - Bounce

@interface CSBounceLeft : CSAnimation
@end
@implementation CSBounceLeft
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeBounceLeft];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:duration/4 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(-10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeTranslation(5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeTranslation(-2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}
@end

@interface CSBounceRight : CSAnimation
@end
@implementation CSBounceRight
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeBounceRight];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:duration/4 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeTranslation(-5, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeTranslation(2, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}
@end

@interface CSBounceDown : CSAnimation
@end
@implementation CSBounceDown
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeBounceDown];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:duration/4 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, -10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeTranslation(0, 5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeTranslation(0, -2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}
@end

@interface CSBounceUp : CSAnimation
@end
@implementation CSBounceUp
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeBounceUp];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:duration/4 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, 10);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeTranslation(0, -5);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeTranslation(0, 2);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}
@end


#pragma mark - Slide
@interface CSSlideLeft : CSAnimation
@end
@implementation CSSlideLeft
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeSlideLeft];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSSlideRight : CSAnimation
@end
@implementation CSSlideRight
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeSlideRight];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSSlideDown : CSAnimation
@end
@implementation CSSlideDown
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeSlideDown];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSSlideUp : CSAnimation
@end
@implementation CSSlideUp
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeSlideUp];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end


#pragma mark - Fade
@interface CSFadeIn : CSAnimation
@end
@implementation CSFadeIn
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeIn];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
    } completion:^(BOOL finished) { }];
}
@end

@interface CSFadeOut : CSAnimation
@end
@implementation CSFadeOut
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeOut];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 1;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 0;
    } completion:^(BOOL finished) { }];
}
@end

@interface CSFadeInLeft : CSAnimation
@end
@implementation CSFadeInLeft
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeInLeft];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    view.transform = CGAffineTransformMakeTranslation(300, 0);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSFadeInRight : CSAnimation
@end
@implementation CSFadeInRight
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeInRight];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    view.transform = CGAffineTransformMakeTranslation(-300, 0);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSFadeInDown : CSAnimation
@end
@implementation CSFadeInDown
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeInDown];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    view.transform = CGAffineTransformMakeTranslation(0, -300);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

@interface CSFadeInUp : CSAnimation
@end
@implementation CSFadeInUp
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFadeInUp];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    view.transform = CGAffineTransformMakeTranslation(0, 300);
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(0, 0);
    } completion:^(BOOL finished) { }];
}
@end

#pragma mark - Fun
@interface CSPop : CSAnimation
@end
@implementation CSPop
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypePop];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateKeyframesWithDuration:duration/3 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeScale(0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}
@end

@interface CSMorph : CSAnimation
@end
@implementation CSMorph
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeMorph];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateKeyframesWithDuration:duration/4 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeScale(1, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeScale(1.2, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeScale(0.9, 0.9);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/4 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL finished) {
                    
                }];
            }];
        }];
    }];
}
@end

@interface CSFlash : CSAnimation
@end
@implementation CSFlash
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeFlash];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    [UIView animateKeyframesWithDuration:duration/3 delay:delay options:0 animations:^{
        // End
        view.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
            // End
            view.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/3 delay:0 options:0 animations:^{
                // End
                view.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}
@end

@interface CSShake : CSAnimation
@end
@implementation CSShake
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeShake];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView animateKeyframesWithDuration:duration/5 delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeTranslation(30, 0);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
            // End
            view.transform = CGAffineTransformMakeTranslation(-30, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                // End
                view.transform = CGAffineTransformMakeTranslation(15, 0);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                    // End
                    view.transform = CGAffineTransformMakeTranslation(-15, 0);
                } completion:^(BOOL finished) {
                    [UIView animateKeyframesWithDuration:duration/5 delay:0 options:0 animations:^{
                        // End
                        view.transform = CGAffineTransformMakeTranslation(0, 0);
                    } completion:^(BOOL finished) {
                        // End
                    }];
                }];
            }];
        }];
    }];
}
@end

@interface CSZoomIn : CSAnimation
@end
@implementation CSZoomIn
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeZoomIn];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeScale(1, 1);
    view.alpha = 1;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeScale(2, 2);
        view.alpha = 0;
    } completion:^(BOOL finished) {
//        view.transform = CGAffineTransformMakeScale(1, 1);
//        view.alpha = 1;
    }];
}
@end

@interface CSZoomOut : CSAnimation
@end
@implementation CSZoomOut
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeZoomOut];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.transform = CGAffineTransformMakeScale(2, 2);
    view.alpha = 0;
    [UIView animateKeyframesWithDuration:duration delay:delay options:0 animations:^{
        // End
        view.transform = CGAffineTransformMakeScale(1, 1);
        view.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}
@end

@interface CSSpiralIn : CSAnimation
@end
@implementation CSSpiralIn
+ (void)load {
    [self registerClass:self forAnimationType:CSAnimationTypeSpiralIn];
}
+ (void)performAnimationOnView:(UIView *)view duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay {
    // Start
    view.alpha = 0;
    view.transform = CGAffineTransformMakeTranslation(0, -40);
    [UIView animateKeyframesWithDuration:duration/8 delay:delay options:0 animations:^{
        // End
        view.alpha = 1 / 8.0;
        view.transform = CGAffineTransformMakeTranslation(35*0.7071, -35*0.7071);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
            // End
            view.alpha = 2 / 8.0;
            view.transform = CGAffineTransformMakeTranslation(30, 0);
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                // End
                view.alpha = 3 / 8.0;
                view.transform = CGAffineTransformMakeTranslation(25*0.7071, 25*0.7071);
            } completion:^(BOOL finished) {
                [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                    // End
                    view.alpha = 4 / 8.0;
                    view.transform = CGAffineTransformMakeTranslation(0, 20);
                } completion:^(BOOL finished) {
                    [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                        // End
                        view.alpha = 5 / 8.0;
                        view.transform = CGAffineTransformMakeTranslation(-15*0.7071, 15*0.7071);
                    } completion:^(BOOL finished) {
                        [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                            // End
                            view.alpha = 6 / 8.0;
                            view.transform = CGAffineTransformMakeTranslation(-10, 0);
                        } completion:^(BOOL finished) {
                            [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                                // End
                                view.alpha = 7 / 8.0;
                                view.transform = CGAffineTransformMakeTranslation(-5*0.7071, -5*0.7071);
                            } completion:^(BOOL finished) {
                                [UIView animateKeyframesWithDuration:duration/8 delay:0 options:0 animations:^{
                                    // End
                                    view.alpha = 8 / 8.0;
                                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                                } completion:^(BOOL finished) {
                                    // End
                                }];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
}
@end
