LOGGING_CONFIG = {
    'version': 1,
    'formatters': {'default': {
        'format': '[%(asctime)s.%(msecs)03d] %(levelname)s in %(module)s: %(message)s',
        'datefmt': '%d/%m/%Y %H:%M:%S'
    }},
    'handlers': {'console': {
        'class': 'logging.StreamHandler',
        'stream': 'ext://sys.stdout',
        'formatter': 'default',
        'level': 'INFO'

    },  'file': {
        'class': 'logging.handlers.TimedRotatingFileHandler',
        'formatter': 'default',
        'filename': './logs/log.txt',
        'level': 'DEBUG',
        'when': 'D',
        'backupCount': 30
    },
    },
    'root': {
        'level': 'INFO',
        'handlers': ['console', 'file']
    }
}

MODEL_ARGS = {
    'img_size': 256,
    'style_dim': 64,
    'w_hpf': 1.0,
    'latent_dim': 16,
    'num_domains': 2,
    'wing_path': './expr/checkpoints/wing.ckpt',
    'lm_path': './expr/checkpoints/celeba_lm_mean.npz',
    'resume_iter': 100000,
    'checkpoint_dir': './expr/checkpoints/celeba_hq',
    'mode': 'sample'
}
