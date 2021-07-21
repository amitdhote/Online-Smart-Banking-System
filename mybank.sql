
--
-- Database: `mybank`
--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int primary key auto_increment,
  `atype` varchar(20) NOT NULL,
  `accno` char(10) DEFAULT NULL,
  `bal` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL
);


--
-- Table structure for table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `bid` int  primary key auto_increment,
  `bname` varchar(50) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `ifsc` varchar(20) NOT NULL,
  `accno` varchar(20) NOT NULL,
  `maxlimit` int NOT NULL,
  `userid` varchar(30) NOT NULL
);


--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int primary key auto_increment,
  `cname` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `adhar` char(12) DEFAULT NULL,
  `phone` char(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pic` varchar(50) NOT NULL,
  `signature` varchar(50) NOT NULL
);

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `rid` int  primary key auto_increment,
  `rdate` date NOT NULL,
  `accno` int NOT NULL,
  `description` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `status` varchar(20) NOT NULL
);

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `tid` int  primary key auto_increment,
  `tdate` date DEFAULT NULL,
  `ttype` varchar(50) DEFAULT NULL,
  `accno` char(10) DEFAULT NULL,
  `cramount` int DEFAULT NULL,
  `dramount` int DEFAULT NULL
);

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uname` varchar(50)  primary key,
  `userid` varchar(50) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `cid` int NOT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uname`, `userid`, `pwd`, `cid`) VALUES
('Administrator', 'amitdhote', 'amit', 0);


