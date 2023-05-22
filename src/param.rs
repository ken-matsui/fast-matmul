use std::fmt::{self, Display, Formatter};

#[derive(Copy, Clone)]
pub struct Param {
    pub nc: usize,
    pub mc: usize,
    pub kc: usize,
}

// Best params for 2048 x 2048 x 2048
cfg_if::cfg_if! {
    if #[cfg(all(target_arch = "aarch64", target_os = "macos"))] {
        // for env1 (TODO: waiting for auto tuning)
        pub const BEST_PARAM: Param = Param {
            nc: 128,
            mc: 1024,
            kc: 1,
        };
    } else if #[cfg(all(target_arch = "x86_64", target_os = "linux"))] {
        // for env2
        pub const BEST_PARAM: Param = Param {
            nc: 128,
            mc: 1024,
            kc: 1,
        };
    } else {
        pub const BEST_PARAM: Param = Param {
            nc: 128,
            mc: 1024,
            kc: 1,
        };
    }
}

impl Default for Param {
    fn default() -> Self {
        Self {
            nc: 1000,
            mc: 64,
            kc: 32,
        }
    }
}

impl Param {
    pub fn new(nc: usize, mc: usize, kc: usize) -> Self {
        Self { nc, mc, kc }
    }
}

impl Display for Param {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "(nc: {}, mc: {}, kc: {})", self.nc, self.mc, self.kc)
    }
}
