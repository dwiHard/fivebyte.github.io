import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Five Byte",
  description: "Cheat sheet by hardiyanto",
  ignoreDeadLinks: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    search: {
      provider: 'local'
    },
    nav: [
      { text: 'Home', link: '/' },
    ],

    sidebar: [
      {
        text: 'DevOps',
        collapsed: true,
        items: [
          { text: 'Docker', link: '/devops/docker' },
          { text: 'Vagrant', link: '/devops/vagrant' },
          { text: 'Ansible', link: '/devops/ansible' },
          { text: 'Kubernetes', link: '/devops/kubernetes' },
          { text: 'Git', link: '/devops/git' }
        ]
      },
      {
        text: 'Android',
        collapsed: true,
        items: [
          { text: 'Trik dan Tips Android', link: '/android/android' },
        ]
      },
      {
        text: 'Build Manager',
        collapsed: true,
        items: [
          { text: 'Apache Maven', link: '/build/apacheMaven' },
        ]
      },
      {
        text: 'Linux',
        collapsed: true,
        items: [
          { text: 'Basic Linux',
            base: 'linux/basic',
            items: [
              { text: 'Systemctl', link: '/systemctl' },
            ]
          },
          { text: 'Config Linux', link: '/linux/linux' },
          { text: 'Config Web Server', link: '/linux/webserver' },
          { text: 'Vim', link: '/linux/vim' },
          { text: 'Apache Zookeeper', link: '/linux/apacheZookeeper' },
          { text: 'Apache HTTP', link: '/linux/apacheHttp' },
        ]
      },
      {
        text: 'Database',
        collapsed: true,
        items: [
          { text: 'My SQL', link: '/database/mysql' },
          { text: 'Mongo DB', link: '/database/mongodb' },
          { text: 'Open Search', link: '/database/openSearch' },
          { text: 'Postgresql', link: '/database/postgresql' },
          { text: 'Apache HBase', link: '/database/apacheHBase' },
          { text: 'Apache Solr', link: '/database/solr' },
          { text: 'Apache Kafka', 
            base: '/database/kafka/', 
            items: [
                { text: 'Set up', link: '/basic' },
                { text: 'Consumer', link: '/consumer' },
                { text: 'Producer', link: '/producer' },
              ]
            },
          { text: 'Apache Hadoop', link: '/database/apacheHadoop' },
        ]
      },
      {
        text: 'Monitoring',
        collapsed: true,
        items: [
          { text: 'Node Exporter', link: '/monitoring/nodeExporter' },
          { text: 'Prometheus', link: '/monitoring/prometheus' },
        ]
      },
      {
        text: 'Testing/Automation',
        collapsed: true,
        items: [
          { text: 'Selenium', link: '/testing/selenium' },
        ]
      },
      {
        text: 'Penetration Testing ',
        collapsed: true,
        items: [
          { text: 'Exploit', link: '/pentest/exploit' },
          { text: 'Secure Web', link: '/pentest/secureWeb' },
        ]
      },
      {
        text: 'Developer',
        collapsed: true,
        items: [
          { text: 'HTML', link: '/developer/html' },
          { text: 'RegEx', link: '/developer/regex' },
          { text: 'Spring boot', link: '/developer/springBoot' },
          { text: 'Laravel', link: '/developer/laravel' },
          { text: 'Node Js', link: '/developer/nodejs' },
          { text: 'Python', link: '/developer/python' },
          { 
            text: 'Java', 
            base: '/developer/java/',
            items: [
              { text: 'Stream Filter', link: '/streamFilter'},
              { text: 'Stream collect', link: '/streamCollect' },
              { text: 'ForEach', link: '/forEach'},
              { text: 'Stream Map', link: '/streamMap' },
              { text: 'Hashing Java', link: '/hashing' },
              { text: "OkHttp", link: '/okhttp' },
              { text: 'Reference', link: '/referensi' },
            ]
          }
        ]
      },
      {
        text: 'Reference',
        collapsed: true,
        items: [
          { text: 'Link Reference', link: '/referensi/linkReference' },
        ]
      },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/dwiHard' }
    ]
  }
})
