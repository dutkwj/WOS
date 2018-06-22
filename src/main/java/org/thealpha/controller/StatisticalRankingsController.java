package org.thealpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.thealpha.model.Scholar;
import org.thealpha.service.RankService;

import java.util.List;

/**
 * Created by kangwenjie on 18-1-22.
 */
@Controller
@RequestMapping("/rank")
public class StatisticalRankingsController {

    @Autowired
    private RankService rankService;

    @RequestMapping("/index")
    public String index(Model model) {
        List<Scholar> top100Scholars = rankService.getTop100Cooperators();
        model.addAttribute("scholars", top100Scholars);
//        return "statisticalRankings";
        return "flights";
    }

    @RequestMapping("/top100")
    public String getScholarsByType(@RequestParam String type, @RequestParam String range, @RequestParam String upOrDown, @RequestParam String period, @RequestParam String academicage, Model model) {
        List<Scholar> scholars = null;
        if ("cooperator number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100Cooperators();
            } else {
                scholars = rankService.getBottom100Cooperators();
            }
        } else if ("team members".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100TeamMembers();
            } else {
                scholars = rankService.getBottom100TeamMembers();
            }
        } else if ("students number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100Students();
            } else {
                scholars = rankService.getBottom100Students();
            }
        } else if ("reference number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100RefNumber();
            } else {
                scholars = rankService.getBottom100RefNumber();
            }
        } else if ("referenced number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100RefedNumber();
            } else {
                scholars = rankService.getBottom100RefedNumber();
            }
        } else if ("common reference number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100CoRef();
            } else {
                scholars = rankService.getBottom100CoRef();
            }
        } else if ("common referenced number".equals(type)) {
            if ("down".equals(upOrDown)) {
                scholars = rankService.getTop100CoRefed();
            } else {
                scholars = rankService.getBottom100CoRefed();
            }
        } else if ("potential index".equals(type)) {
            if ("3 years".equals(period)) {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potential_3years();
                } else {
                    scholars = rankService.getBottom100Potential_3years();
                }
            } else if ("5 years".equals(period)) {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potential_5years();
                } else {
                    scholars = rankService.getBottom100Potential_5years();
                }
            } else {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potential_10years();
                } else {
                    scholars = rankService.getBottom100Potential_10years();
                }
            }
        } else if ("potential index by growthrate".equals(type)) {
            if ("3 years".equals(period)) {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potentialgrowth_3years();
                } else {
                    scholars = rankService.getBottom100Potentialgrowth_3years();
                }
            } else if ("5 years".equals(period)) {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potentialgrowth_5years();
                } else {
                    scholars = rankService.getBottom100Potentialgrowth_5years();
                }
            } else {
                if ("down".equals(upOrDown)) {
                    scholars = rankService.getTop100Potentialgrowth_10years();
                } else {
                    scholars = rankService.getBottom100Potentialgrowth_10years();
                }
            }
        } else if ("potential index by academicage".equals(type)) {
            if ("3 years".equals(period)) {
                if ("1-5".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca1_5_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca1_5_3years();
                    }
                } else if ("6-15".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca6_15_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca6_15_3years();
                    }
                } else if ("16-25".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca16_25_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca16_25_3years();
                    }
                } else if ("26-40".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca26_40_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca26_40_3years();
                    }
                } else if ("41-60".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca41_60_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca41_60_3years();
                    }
                } else {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca61_80_3years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca61_80_3years();
                    }
                }
            } else if ("5 years".equals(period)) {
                if ("1-5".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca1_5_5years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca1_5_5years();
                    }
                } else if ("6-15".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca6_15_5years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca6_15_5years();
                    }
                } else if ("16-25".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca16_25_5years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca16_25_5years();
                    }
                } else if ("26-40".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca26_40_5years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca26_40_5years();
                    }
                } else if ("41-60".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca41_60_5years();
                    } else {
                        scholars = rankService.getBottom100Potential41_60_5years();
                    }
                } else {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca61_80_5years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca61_80_5years();
                    }
                }
            } else {
                if ("1-5".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca1_5_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca1_5_10years();
                    }
                } else if ("6-15".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca6_15_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca6_15_10years();
                    }
                } else if ("16-25".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca16_25_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca16_25_10years();
                    }
                } else if ("26-40".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca26_40_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca26_40_10years();
                    }
                } else if ("41-60".equals(academicage)) {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca41_60_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca41_60_10years();
                    }
                } else {
                    if ("down".equals(upOrDown)) {
                        scholars = rankService.getTop100Potentialaca61_80_10years();
                    } else {
                        scholars = rankService.getBottom100Potentialaca61_80_10years();
                    }
                }
            }
        }

        if ("top10".equals(range) && scholars.size() > 10) {
            model.addAttribute("scholars", scholars.subList(0, 10));
        } else if ("top50".equals(range) && scholars.size() > 50) {
            model.addAttribute("scholars", scholars.subList(0, 50));
        } else {
            model.addAttribute("scholars", scholars);
        }
        char[] caType = type.toCharArray();
        caType[0] -= 32;
        type = String.valueOf(caType);
        model.addAttribute("type", type);
        return "scholarRank";
    }
}
